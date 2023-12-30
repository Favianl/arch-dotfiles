
#!/bin/bash
#
#sudo pacman -S bspwm polybar kitty rofi sxhkd nemo nemo-fileroller neofetch htop fzf xf86-video-vesa xf86-video-ati xf86-video-amdgpu vulkan-radeon vulkan-icd-loader xorg-server xorg-xinit xorg-xev xorg mesa mesa-demos gvfs ntfs-3g leafpad picom feh lxappearance arandr neovim lsd bat vlc gpicview evince zip unzip unrar firefox base-devel yad xdotool imagemagick drawing inkscape redshift tree xclip ttf-jetbrains-mono-nerd python3 python-pip locate stylua discord telegram-desktop veracrypt scrcpy obs-studio noise-suppression-for-voice mariadb dbeaver mpv --noconfirm

sudo pacman -S bspwm polybar kitty rofi sxhkd nemo nemo-fileroller neofetch lightdm lightdm-gtk-greeter htop fzf xf86-video-vesa xf86-video-ati xf86-video-amdgpu vulkan-radeon vulkan-icd-loader xorg-server xorg-xinit xorg-xev xorg mesa mesa-demos gvfs ntfs-3g leafpad picom feh lxappearance arandr neovim lsd bat firefox base-devel redshift xclip ttf-jetbrains-mono-nerd python3 python-pip locate stylua calcurse pavucontrol pipewire-pulse papirus-icon-theme gtk3 gtk4 --noconfirm

cp -r config/* ~/.config/

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

