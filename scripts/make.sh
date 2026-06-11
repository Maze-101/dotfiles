#!/bin/bash

var1='doas make clean install'
var2='doas rm config.h'

echo "Building suckless software..."
cd ~/dotfiles/suckless/dwm && $var2 && $var1
cd ../slock && $var2 && $var1
cd ../dwmblocks && doas rm blocks.h && $var1
cd ../st && $var2 && $var1
cd ../dmenu && $var2 && $var1

echo "#############################"
echo "########    Done!    ########"
echo "#############################"
