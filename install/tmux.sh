#!/bin/bash

# Installation script for TMUX
# https://github.com/tmux/tmux

# Make directory for scratch work
install_dir="$HOME/.dotfiles/install_tmux"
current_dir="$PWD"

mkdir -p $install_dir
cd $install_dir

# Get and extract tmux tarball
wget https://github.com/tmux/tmux/releases/download/2.6/tmux-2.6.tar.gz
tar -xvzf tmux-2.6.tar.gz
cd tmux-2.6

# Configure to install to $HOME/bin
./configure --prefix=$HOME/bin
make && make install

# Setup TPM
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Clean up
cd $current_dir
rm -rf $install_dir
