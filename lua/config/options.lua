vim.opt.number = true
vim.opt.relativenumber = true

-- Indentation options
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Search options
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Wrapping and reading text
vim.opt.wrap = false
vim.opt.linebreak = false
vim.opt.breakindent = true

-- Cursor context and movement
vim.opt.sidescrolloff = 8
vim.opt.scrolloff = 8
vim.opt.cursorline = true

-- Split behavior
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Signs, whitespace, and visual helpers
vim.opt.signcolumn = "auto"
vim.opt.list = true
vim.opt.showcmd = false
vim.opt.ruler = true
vim.opt.rulerformat = "%= %p%%"

-- Clipboard and mouse
--vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = ""

-- Undo, files, and update behavior
vim.opt.updatetime = 250
vim.opt.undofile = true
vim.opt.undolevels = 1000000
vim.opt.swapfile = false
vim.opt.backup = false

-- Color and terminal UI
vim.opt.termguicolors = true
vim.opt.laststatus = 0
vim.opt.cmdheight= 0

-- Completion and command-line comfort
vim.opt.completeopt = { "menu", "menuone", "longest" }

