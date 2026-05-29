#!/bin/bash

var1='sudo make clean install'
var2='rm config.h'

echo "Building suckless software..."
cd ~/Dotfiles/suckless/dwm && $var2 && $var1
cd ../slock && $var2 && $var1
cd ../dwmblocks && rm blocks.h && $var1

echo "#############################"
echo "########    Done!    ########"
echo "#############################"