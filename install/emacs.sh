#!/bin/bash

# Installation script for EMACS (with SPACEMACS)
# https://github.com/emacs-mirror/emacs
# https://github.com/syl20bnr/spacemacs

# Make directory for scratch work
install_dir="$HOME/.dotfiles/install_emacs"
current_dir="$PWD"

# Emacs version
branch="emacs-26"

mkdir -p $install_dir
cd $install_dir

# Pull and install emacs
git clone -b $branch https://github.com/emacs-mirror/emacs.git
cd emacs

# Configure to install to $HOME/bin
./autogen.sh
./configure --prefix=$HOME/bin
make && make install

# Pull spacemacs configs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# Clean up
cd $current_dir
rm -rf $install_dir
