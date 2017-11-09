#!/bin/bash

dotfiles=".dotfiles"
source_files="source"

for file in ~/$dotfiles/$source_files/{.sh,.bash}/.[a-zA-Z]*; do
	source "$file"
done
