#!/bin/bash

sudo pacman -S bspwm polybar kitty rofi clipmenu sxhkd nemo nemo-fileroller dunst fastfetch lightdm lightdm-gtk-greeter htop fzf xf86-video-vesa xf86-video-ati xf86-video-amdgpu vulkan-radeon vulkan-icd-loader xorg-server xorg-xinit xorg-xev xorg mesa mesa-demos gvfs ntfs-3g leafpad picom feh flameshot lxappearance qt5ct arandr neovim fd lsd bat firefox base-devel redshift vlc evince zip unzip unrar base-devel yad xdotool drawing inkscape gimp redshift tree xclip ttf-jetbrains-mono-nerd python3 python-pip locate stylua calcurse pavucontrol pipewire-pulse papirus-icon-theme network-manager-applet gtk3 gtk4 discord telegram-desktop veracrypt scrcpy obs-studio noise-suppression-for-voice mariadb dbeaver mpv qemu-full libvirt virt-manager iptables dnsmasq dmidecode bridge-utils openbsd-netcat polkit-gnome gnome-calculator --noconfirm

mkdir ~/.config/
rm -rf ~/.config/bspwm
ln -s $HOME/arch-dotfiles/config/bspwm/ ~/.config/bspwm
rm -rf ~/.config/kitty
ln -s $HOME/arch-dotfiles/config/kitty/ ~/.config/kitty
rm -rf ~/.config/nvim
ln -s $HOME/arch-dotfiles/config/nvim/ ~/.config/nvim
rm -rf ~/.config/picom
ln -s $HOME/arch-dotfiles/config/picom/ ~/.config/picom
rm -rf ~/.config/polybar
ln -s $HOME/arch-dotfiles/config/polybar/ ~/.config/polybar
rm -rf ~/.config/redshift
ln -s $HOME/arch-dotfiles/config/redshift/ ~/.config/redshift
rm -rf ~/.config/rofi
ln -s $HOME/arch-dotfiles/config/rofi/ ~/.config/rofi
rm -rf ~/.config/sxhkd
ln -s $HOME/arch-dotfiles/config/sxhkd/ ~/.config/sxhkd
rm -rf ~/.config/dunst
ln -s $HOME/arch-dotfiles/config/dunst/ ~/.config/dunst
rm -rf ~/.config/pipewire
ln -s $HOME/arch-dotfiles/config/pipewire/ ~/.config/pipewire

ln -s $HOME/arch-dotfiles/scripts/ ~/my-scripts

bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" &
wait
echo "Oh My Bash installed..."

echo "Copying home files..."
sleep 3
rm ~/.bashrc
cp -r home/. ~/

sudo systemctl enable lightdm

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

echo "============ End ==============="

