#!/bin/bash

##Packages
if [ ! -e "packages.txt" ]; then
    printf "Error: 'packages.txt' doesn't exist."
else
    while read -r line; do
        sudo apt-get install $line
    done < "packages.txt"
fi


##Configs
shopt -s dotglob
for i in *; do
    if [ -d $i ]; then
        cp -r $i $HOME/
    else
        cp $i $HOME/
    fi
done

rm -f $HOME/packages.txt
rm -f $HOME/restore.sh
rm -r $HOME/backup.sh
