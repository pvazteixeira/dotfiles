# dotfiles

host provisioning using `ansible`+`chezmoi`+`git`

## try

```sh
docker compose -f docker/compose.yml run --build --rm dotfiles \
  bash -lc 'bash ~/dotfiles/docker/bootstrap-test.sh && exec zsh -l'
```

## setup

```sh
sudo apt install ansible git
git clone --depth 1 https://github.com/pvazteixeira/dotfiles.git ~/dotfiles
cd ~/dotfiles
ansible-galaxy install -r ansible/requirements.yml
ansible-playbook --ask-become-pass ansible/playbook.yml
chezmoi init --apply --source ~/dotfiles/home
```

*Note*: git identity is stored in `~/.gitconfig.local`


## update

```sh
chezmoi update   # pull this repo + re-apply (add -R to also refresh externals: oh-my-zsh, p10k, …)
```

## test

Run the bootstrap and verification checks in a throwaway Debian container (this
repo mounted read-only), from the repo root:

```sh
docker compose -f docker/compose.yml run --build --rm dotfiles
```
