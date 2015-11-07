#!/bin/bash

git pull origin master

CURRENTDIR=$(pwd)
echo "running script from $CURRENTDIR"

# bash stuff
for FILE in .{bashrc,bash_aliases,bash_logout,bash_prompt}
do
  if [ -f "$HOME/$FILE" ]; then
    echo "$FILE exists; skipping."
  else
    echo "$FILE does not exist; creating symbolic link."
    ln -s "$CURRENTDIR/bash/$FILE" "$HOME/$FILE"   #absolute path
  fi
done;
unset FILE

# terminator
if [ -f "$HOME/.config/terminator/" ]; then
  echo "terminator config exists; skipping."
else
  echo "$terminator config does not exist; creating symbolic link."
  ln -s "$CURRENTDIR/terminator" "$HOME/.config/terminator"   #absolute path
fi

# sublime text 2
ln -s "$CURRENTDIR/sublime/Preferences.sublime-settings" "$HOME/.config/sublime-text-2/Packages/User/Preferences.sublime-settings"

# xfce4
if [ -f "$HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml" ]; then
  rm "$HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml"
fi
ln -s "$CURRENTDIR/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml" "$HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml" 
