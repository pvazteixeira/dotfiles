# dotfiles

## dependencies
Most of the dependencies are handled by install.sh
Other than that, these are also required:
* ohmyzsh
* tmux plugin manager (tpm)
* gnu stow

## setup/usage

Run stow, e.g.:

```sh
stow zsh
```

this will create symlinks in `$HOME` for the files in `dotfiles/zsh`

## notes

### Setting Caps Lock to Escape

To swap the two keys in the current session: 

```sh
setxkbmap -option caps:escape
```

To make this change persistent:

```sh
missing command
```

