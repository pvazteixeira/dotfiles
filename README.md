# dotfiles


## setup

Clone this repo, install `ansible` (`apt install ansible`), and run the playbook:

```sh
git clone https://github.com/pvazteixeira/dotfiles.git
sudo apt install ansible
cd dotfiles
ansible-playbook --ask-become-pass playbook.yml
```

This sets up most things - the remainder is work-in-progress.


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

To permanently swap escape to caps lock using `dconf-editor`
([source](https://askubuntu.com/questions/363346/how-to-permanently-switch-caps-lock-and-esc)):

- get it: `sudo apt-get install dconf-tools`
- open and navigate to: *org* >> *gnome* >> *desktop* >> *input-sources*
- inside `xkb-options` add: `'caps:swapescape'`


