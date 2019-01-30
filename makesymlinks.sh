#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home DIRectory to any desired dotfiles in ~/dotfiles
############################

########## Variables
DIR=${PWD}
OLDDIR="${DIR}_old"            # old dotfiles backup DIRectory

# create dotfiles_old in homeDIR
if [ ! -d $OLDDIR ]; then
  echo "Creating $OLDDIR for backup of any existing dotfiles in ~"
  mkdir -p $OLDDIR/.config
  echo "...done"
fi

# change to the dotfiles DIRectory
echo "Changing to the $DIR DIRectory"
cd $DIR
echo "...done"

printf "Starting linking process:\n\n"

for f in ./.*; do
  if [ $f == "./." ] || [ $f == "./.." ] || [ $f == "./.git" ]; then
    continue
  fi
  FILE=${f##*/}
  if [ $FILE == ".config" ]; then
    for fc in ./.config/*; do
      FILE=${fc##*/}
      echo "Processing ~/.config/$FILE"
      if [ -f "$HOME/.config/$FILE" ] || [ -d "$HOME/.config/$FILE" ]; then
        echo "Backing up $HOME/.config/$FILE to $OLDDIR/.config"
        mv "$HOME/.config/$FILE" "$OLDDIR/.config/" || exit 1
      fi
      echo "Creating symlink to $DIR/.config/$FILE in ~/.config/$FILE"
      ln -s "$DIR/.config/$FILE" "$HOME/.config/$FILE" || exit 1
      printf ".config/$FILE done\n\n"
    done
  else
    echo "Processing ~/$FILE"
    if [ -f "$HOME/$FILE" ] || [ -d "$HOME/$FILE" ]; then
      echo "Backing up $HOME/$FILE to $OLDDIR"
      mv "$HOME/$FILE" "$OLDDIR/" || exit 1
    fi
    echo "Creating symlink to $DIR/$FILE in ~/"
    ln -s "$DIR/$FILE" "$HOME/$FILE" || exit 1
    printf "$FILE done\n\n"
  fi
done
