#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=$HOME/dotfiles                    # dotfiles directory
olddir=$HOME/dotfiles_old             # old dotfiles backup directory

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir/.config
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

files=${PWD}/
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
        echo "Backing up $HOME/.config/$FILE"
        mv "$HOME/.config/$FILE" "$olddir/.config/" || exit 1
      fi
      echo "Creating symlink to $dir/.config/$FILE in ~/.config/$FILE"
      ln -s "$dir/.config/$FILE" "$HOME/.config/$FILE" || exit 1
      printf ".config/$FILE done\n\n"
    done
  else
    echo "Processing ~/$FILE"
    if [ -f "$HOME/$FILE" ] || [ -d "$HOME/$FILE" ]; then
      echo "Backing up $HOME/$FILE"
      mv "$HOME/$FILE" "$olddir/" || exit 1
    fi
    echo "$dir/$FILE"
    echo "Creating symlink to $dir/$FILE in ~/"
    ln -s "$dir/$FILE" "$HOME/$FILE" || exit 1
    printf "$FILE done\n\n"
  fi
done
