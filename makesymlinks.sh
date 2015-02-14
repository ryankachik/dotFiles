#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc vim config tmux.conf kdiff3rc"    # list of files/folders to symlink in homedir, ignore bash_profile, that should contain system specific vars/aliases

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

#dont want to share un/pw on github, so find and replace
if [ -f ~/.config/powerline/themes/tmux/default.json ]; then
    sed -i.bak s/\$POWERLINE_EMAIL_ADDRESS/$POWERLINE_EMAIL_ADDRESS/g ~/.config/powerline/themes/tmux/default.json
    sed -i.bak s/\$POWERLINE_EMAIL_PASSWORD/$POWERLINE_EMAIL_PASSWORD/g ~/.config/powerline/themes/tmux/default.json
fi