vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("v", "<leader>p", function()
	local val = vim.fn.getreg("+")
	vim.api.nvim_command([[normal! p]])
	vim.fn.setreg("+", val)
end, { desc = "Special paste, paste without replacing copy register content" })

-- general keymaps

----- Quit ----
keymap.set("n", "<leader>q", ":q<CR>")

----- Save ----
keymap.set("n", "<leader>w", ":w<CR>")

----- Quit whitout save ----
keymap.set("n", "<leader>0", ":q!<CR>")

--- shortcut Escape from insert mode
keymap.set("i", "jk", "<Esc>")

keymap.set("n", "<leader><leader>ca", "ggVGy", { desc = "Copy all" })
------ Remove search highlight ------
keymap.set("n", "<leader><Esc>", ":nohlsearch<CR>")

------ Open/Close Neotree ------
-- keymap.set("n", "<leader>e", ":Neotree toggle<CR>")

vim.keymap.set("n", "<leader>e", function()
	local root = require("utils.root").get_root()

	require("neo-tree.command").execute({
		toggle = true,
		dir = root,
	})
end, { desc = "Neo-tree project root" })

-- move line normal mode
keymap.set("n", "<A-j>", ":m .+1<CR>==")
keymap.set("n", "<A-k>", ":m .-2<CR>==")
-- insert mode
keymap.set("i", "<A-j>", ":m .+1<CR>==")
keymap.set("i", "<A-k>", ":m .-2<CR>==")

-- move block visual mode
keymap.set("v", "<A-j>", ":m '>+1<CR>gv")
keymap.set("v", "<A-k>", ":m '<-2<CR>gv")

-- Bufferline --
-- close tab
-- keymap.set("n", "<leader>c", "<cmd>bdelete<cr>")
keymap.set("n", "<leader>c", ":bd<cr>")
-- force close tab
keymap.set("n", "<leader>C", "<cmd>bdelete!<cr>")
-- next tab
keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>")
-- prev tab
keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>")
-- move tab to right
keymap.set("n", "<leader>9", "<cmd>BufferLineMoveNext<cr>")
-- move tab to left
keymap.set("n", "<leader>8", "<cmd>BufferLineMovePrev<cr>")
-- new tab
keymap.set("n", "<leader>bb", "<cmd>tabnew<cr>")
-- pick to close
keymap.set("n", "<leader>bc", "<cmd>BufferLinePickClose<cr>")
-- pick to jump
keymap.set("n", "<leader>bj", "<cmd>BufferLinePick<cr>")
-- sort by tabs
keymap.set("n", "<leader>bt", "<cmd>BufferLineSortByTabs<cr>")

-- Avoid replacing clipboard register
-- keymap.set("v", "<leader>p", '"_dp')

-- keymap.set("v", "<leader>p", '"_dhp')

-- keymap.set("v", "<leader>p", '_"0p')
-- keymap.set("n", "<leader>p", '"0p')
--

------------ Hop keymaps ------------------

keymap.set("n", "<leader>hh", "<cmd>HopWord<cr>")
keymap.set("n", "<leader>ho", "<cmd>HopChar1<cr>")
keymap.set("n", "<leader>ht", "<cmd>HopChar2<cr>")

keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

----- Obsidian -----
vim.keymap.set("n", "<leader>oc", "<cmd>ObsidianCheck<CR>", { desc = "Obsidian Check Checkbox" })
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "Insert Obsidian Template" })
vim.keymap.set("n", "<leader>oo", "<cmd>Obsidian Open<CR>", { desc = "Open in Obsidian App" })
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Show ObsidianBacklinks" })
vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<CR>", { desc = "Show ObsidianLinks" })
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Create New Note" })
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search Obsidian" })
vim.keymap.set("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Quick Switch" })
