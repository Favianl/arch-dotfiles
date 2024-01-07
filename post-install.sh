#!/bin/bash

echo "Node installing..."
nvm install v18.19.0
nvm use v18.19.0

echo "Keyboard configuration..."
sudo cp 00-keyboard.conf /etc/X11/xorg.conf.d/00-keyboard.conf 

echo "Yay installing..."
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si

sleep 3
cd ..
rm -rf yay-bin

echo "Brave installing..."
yay -S brave-bin dropbox nemo-dropbox --noconfirm

echo 'QT_QPA_PLATFORMTHEME="qt5ct"' | sudo tee -a /etc/environment
