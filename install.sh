#!/bin/sh

rm -rf $HOME/.tmux.conf
ln -s -f $PWD/tmux.conf ~/.tmux.conf

rm -rf $HOME/bash_aliases
ln -s -f $PWD/bash_aliases ~/.bash_aliases

rm -rf $HOME/.config/nvim
ln -s -f $PWD/nvim ~/.config/nvim
