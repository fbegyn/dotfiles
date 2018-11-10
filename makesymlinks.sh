#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc zshrc tmux tmux.conf gitconfig xinitrc Xresources"    # list of files/folders to symlink in homedir
configfiles="functions.sh aliases.sh exports.sh liquidpromptrc mimeapps.list z.sh redshift i3 i3status compton.conf dunst mpv git-completions.sh"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir/.config
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
  echo "Moving any existing dotfiles from ~ to $olddir"
  mv ~/.$file ~/dotfiles_old/
  echo "Creating symlink to $file in home directory."
  ln -s $dir/.$file ~/.$file
done

# do the same for the .config files
for file in $configfiles; do
  echo "Backing up existing files in .config"
  mv ~/.config/$file ~/dotfiles_old/.config/
  echo "Creating symlink to $file in ~/.config directory."
  ln -s $dir/.config/$file ~/.config/$file
done
