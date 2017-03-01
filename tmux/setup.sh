#!/bin/bash

mkdir -p "$HOME/.tmux/plugins"

# clone the tmux plugin manager repo
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# create symlink to user preferences
ln -s "$HOME/dotfiles/tmux/.tmux.conf" "$HOME/.tmux.conf"
