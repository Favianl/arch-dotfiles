# !/bin/bash

# Save shortcuts
#
# dconf dump /org/gnome/desktop/wm/keybindings/ > gnome_shortcuts.txt


# Save custom shortcuts
#
# dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > gnome_custom_shortcuts.txt
#
# Save custom 2 shortcuts
#
# dconf dump /org/gnome/mutter/keybindings/ > gnome_custom2_shortcuts.txt
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

dconf load /org/gnome/desktop/wm/keybindings/ < "$CURRENT_DIR/gnome_shortcuts.txt"
dconf load /org/gnome/settings-daemon/plugins/media-keys/ < "$CURRENT_DIR/gnome_custom_shortcuts.txt"
dconf load /org/gnome/mutter/keybindings/ < "$CURRENT_DIR/gnome_custom2_shortcuts.txt"
