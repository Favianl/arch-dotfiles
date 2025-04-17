#!/bin/bash

sudo pacman -S zsh kitty git clipmenu fastfetch htop fzf ntfs-3g neovim fd lsd bat firefox redshift vlc zip unzip unrar yad xdotool drawing inkscape gimp tree xclip ttf-jetbrains-mono-nerd python3 python-pip locate stylua discord telegram-desktop veracrypt scrcpy obs-studio noise-suppression-for-voice dbeaver mpv qemu-full libvirt virt-manager iptables dnsmasq dmidecode bridge-utils openbsd-netcat --noconfirm

rm -rf ~/.config/kitty
ln -s $HOME/arch-dotfiles/config/kitty/ ~/.config/kitty
rm -rf ~/.config/nvim
ln -s $HOME/arch-dotfiles/config/nvim/ ~/.config/nvim
rm -rf ~/.config/redshift
ln -s $HOME/arch-dotfiles/config/redshift/ ~/.config/redshift
rm -rf ~/.config/pipewire
ln -s $HOME/arch-dotfiles/config/pipewire/ ~/.config/pipewire

#ln -s $HOME/arch-dotfiles/scripts/ ~/my-scripts

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &
wait
echo "Oh My Zsh installed..."

echo "Copying home files..."
sleep 3

cp -r home/. ~/

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash

source ~/.zshrc

echo "update .zshrc ..."
sleep 3


git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Zsh plugins installing..."
sleep 3

echo "Yay installing..."
git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si

cd ..
rm -rf yay-bin

echo "remove yay-bin..."
sleep 3

echo "installing apps from AUR..."
yay -S brave-bin dropbox anki-bin extension-manager --noconfirm


echo "Set custom shortcuts..."
./my-shortcuts/set-shortcuts.sh

echo "Set gnome extension config..."
./extension-config/load-config.sh

echo "Set Wallpaper..."
IMAGE="$HOME/Pictures/wallpaper4.jpg"
#Light
# gsettings set org.gnome.desktop.background picture-uri "file:///$IMAGE"
#Dark
gsettings set org.gnome.desktop.background picture-uri-dark "file:///$IMAGE"

chsh -s /bin/zsh

echo "Node installing..."
nvm install v20.18.1
nvm use v20.18.1


echo "Reboot in 5s..."
sleep 5
reboot


echo "============ End ==============="

