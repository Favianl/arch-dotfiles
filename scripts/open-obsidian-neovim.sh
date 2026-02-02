#!/bin/zsh

# Load shell environment (crucial for nvm/PATH)
if [ -f "$HOME/.zshrc" ]; then
  source "$HOME/.zshrc"
fi

# Vault path
OBSIDIAN_VAULT_PATH="$HOME/Documents/leo-notes/"

# Kitty window title
KITTY_WINDOW_TITLE="obsidian-nvim"

# Launch Kitty, set the working directory, and open Neovim with Telescope
kitty --title "$KITTY_WINDOW_TITLE" -d "$OBSIDIAN_VAULT_PATH" nvim README.md -c "lua vim.defer_fn(function() if pcall(require, 'telescope') then require('telescope.builtin').find_files() end end, 100)"

#old command:
# kitty --title obsidian-nvim -e zsh -lc "cd ~/Documents/leo-notes/ && nvim README.md -c \"lua vim.defer_fn(function() if pcall(require, 'telescope') then require('telescope.builtin').find_files() end end, 100)\""
