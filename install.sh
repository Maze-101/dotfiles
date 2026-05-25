#!/bin/bash

echo "Building suckless software..."
cd ~/Dotfiles/suckless/dwm && sudo make clean install
cd ../st && sudo make clean install
cd ../dmenu && sudo make clean install

echo "#############################"
echo "########    Done!    ########"
echo "#############################"