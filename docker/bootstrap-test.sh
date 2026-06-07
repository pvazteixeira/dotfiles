#!/usr/bin/env bash
# Bootstrap test, run inside the container by compose.yml as the non-root `pvt`
# user (repo bind-mounted read-only at ~/dotfiles). Runs the playbook minus the
# desktop/heavy `extras`, applies the chezmoi source non-interactively, then
# verifies the result.
#
# Standalone use (inside a container with the repo at ~/dotfiles):
#   bash ~/dotfiles/docker/bootstrap-test.sh
set -euo pipefail

cd "$HOME/dotfiles"

echo "### 0/3  refresh apt cache (slim image ships without lists) ###"
sudo apt-get update -qq

echo "### 1/3  ansible-playbook (skipping extras) ###"
ansible-playbook ansible/playbook.yml --skip-tags extras

echo "### 2/3  chezmoi init --apply (defaults, non-interactive) ###"
export PATH="$HOME/.local/bin:$PATH"
chezmoi init --apply --promptDefaults --source "$HOME/dotfiles/home"

echo "### 2b   re-apply with no --source (validates persisted sourceDir) ###"
chezmoi apply

echo "### 3/3  verify ###"
fail=0
check() { if eval "$2"; then echo "  ok   $1"; else echo "  FAIL $1"; fail=1; fi; }
check "~/.zshrc present"               '[ -f "$HOME/.zshrc" ]'
check "~/.gitconfig personal identity" 'grep -q pvazteixeira@gmail.com "$HOME/.gitconfig"'
check "oh-my-zsh external cloned"      '[ -f "$HOME/.oh-my-zsh/oh-my-zsh.sh" ]'
check "powerlevel10k external"         '[ -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k/.git" ]'
check "zsh-autosuggestions external"   '[ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions/.git" ]'
check "zellij installed"               '[ -x "$HOME/.pixi/bin/zellij" ]'
check "zellij config applied"          '[ -f "$HOME/.config/zellij/config.kdl" ]'
check "zellij accepts config"          'PATH="$HOME/.pixi/bin:$PATH" zellij setup --check >/dev/null 2>&1'
check "zellij on ssh PATH (zsh -c)"    'zsh -c "command -v zellij" >/dev/null 2>&1'
check "pixi installed"                 '[ -x "$HOME/.pixi/bin/pixi" ]'
check "pixi on PATH via .zshenv"       'grep -q ".pixi/bin" "$HOME/.zshenv"'
check "cargo installed (rustup)"       '[ -x "$HOME/.cargo/bin/cargo" ]'
check "pixi CLIs (rg/fd/zoxide)"       '[ -x "$HOME/.pixi/bin/rg" ] && [ -x "$HOME/.pixi/bin/fd" ] && [ -x "$HOME/.pixi/bin/zoxide" ]'
check "chezmoi config written"         '[ -f "$HOME/.config/chezmoi/chezmoi.toml" ]'
check "login shell is zsh"             'getent passwd "$(id -un)" | grep -q ":/bin/zsh$"'

if [ "$fail" -ne 0 ]; then echo; echo "RESULT: FAILED"; exit 1; fi
echo; echo "RESULT: PASSED"
