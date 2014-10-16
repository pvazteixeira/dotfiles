#!/bin/bash

git pull origin master

CURRENTDIR=$(pwd)
echo "running script from $CURRENTDIR"

# bash stuff
for FILE in .{bashrc,bash_aliases,bash_logout,bash_prompt,profile,path}
do
  if [ -f "$HOME/$FILE" ]; then
    echo "$FILE exists; skipping."
  else
    echo "$FILE does not exist; creating symbolic link."
    ln -s "$CURRENTDIR/$FILE" "$HOME/$FILE"   #absolute path
  fi
done;
unset FILE

# terminator
if [ -f "$HOME/.config/terminator/config" ]; then
  echo "terminator config exists; skipping."
else
  echo "$terminator config does not exist; creating symbolic link."
  ln -s "$CURRENTDIR/config" "$HOME/.config/terminator/config"   #absolute path
fi
