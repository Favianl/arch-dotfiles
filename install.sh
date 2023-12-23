
#!/bin/bash
#
sudo pacman -S bspwm polybar kitty rofi sxhkd nemo neofetch htop xf86-video-vesa xf86-video-ati xf86-video-amdgpu vulkan-radeon vulkan-icd-loader xorg-server xorg-xinit xorg-xev xorg mesa mesa-demos gvfs leafpad picom feh lxappearance lxsession arandr neovim lsd bat vlc gpicview evince zip unzip unrar firefox base-devel yad xdotool imagemagick drawing inkscape redshift tree xclip ttf-jetbrains-mono-nerd python3 python-pip locate stylua --noconfirm

cp -r config/* ~/.config/

bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

rm ~/.bashrc
cp -r home/. ~/

sudo systemctl enable lightdm

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash





echo "============FIN==============="

