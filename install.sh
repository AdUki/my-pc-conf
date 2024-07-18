#!/bin/sh

rm -f $HOME/.tmux.conf
ln -s -f $PWD/tmux.conf ~/.tmux.conf

rm -f $HOME/.tigrc
ln -s -f $PWD/tig.conf ~/.tigrc

rm -f $HOME/bash_aliases
ln -s -f $PWD/bash_aliases ~/.bash_aliases

rm -f $HOME/.config/kitty/kitty.conf
mkdir -p ~/.config/kitty
ln -s -f $PWD/kitty.conf ~/.config/kitty/kitty.conf

rm -rf $HOME/.config/nvim
ln -s -f $PWD/nvim ~/.config/nvim
