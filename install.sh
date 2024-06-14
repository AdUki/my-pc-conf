#!/bin/sh

rm -rf $HOME/.tmux.conf
ln -s -f $PWD/tmux.conf ~/.tmux.conf

rm -rf $HOME/.config/nvim
ln -s -f $PWD/nvim ~/.config/nvim
