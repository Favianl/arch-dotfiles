local opt = vim.opt

-- visual multi mouse enable
vim.g.VM_mouse_mappings = 1

opt.mouse = "a"
opt.errorbells = true
opt.swapfile = false
opt.backup = false
opt.incsearch = true
opt.fileencoding = "utf-8"
opt.showcmd = true
opt.ruler = true
opt.showmatch = true
opt.showmode = false

opt.foldmethod = "manual"

opt.spell = false
opt.signcolumn = "yes"

-- clipboard
opt.clipboard = "unnamedplus"

-- line numbers
opt.relativenumber = true
opt.number = true
opt.numberwidth = 1

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- line wrap
opt.wrap = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

--cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

--split windows
opt.splitright = true
opt.splitbelow = true

-- opt.iskeyword:append("-")
