# !/bin/bash

# dconf dump /org/gnome/shell/extensions/ > gnome-extension-config.dconf

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

dconf load /org/gnome/shell/extensions/ < "$CURRENT_DIR/gnome-extension-config.dconf"
