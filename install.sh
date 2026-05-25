#!/bin/bash

var='sudo make clean install'

echo "Building suckless software..."
cd ~/Dotfiles/suckless/dwm && $var
cd ../slock && $var
cd ../dmenu && $var
cd ../dwmblocks && $var

echo "#############################"
echo "########    Done!    ########"
echo "#############################"