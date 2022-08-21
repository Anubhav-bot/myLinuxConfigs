#!/bin/bash

## The files to be backed up should be manually added to the array below. ##
files=("$HOME/.bashrc" "$HOME/.config" "$HOME/.vimrc" "./backup.sh" "./restore.sh")

## The required packages should also be manually added. ##
packages=('fd-find' 'vim' 'mpv' 'rofi' 'fzf')


mkdir -p $HOME/Backups/"`date`"
dir=$HOME/Backups/"`date`"
touch "$dir/packages.txt"

for i in ${files[@]}; do
    if [ -d $i ]; then
        cp -r $i "$dir/"
    else
        cp $i "$dir/"
    fi
done

for i in ${packages[@]}; do
    echo $i >> "$dir/packages.txt"
done

