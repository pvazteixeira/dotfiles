#!/bin/bash

CURRENTDIR=$(pwd)
echo "running script from $CURRENTDIR"

# bash stuff
for FILE in .{bashrc,bash_aliases,bash_logout,profile,path}
do
  if [ -f "$HOME/$FILE" ]; then
    echo "$FILE exists!"
  else
    echo "$FILE does not exist; creating symbolic link."
    ln -s "$CURRENTDIR/$FILE" "$HOME/$FILE"   #absolute path
  fi
done;
unset FILE
