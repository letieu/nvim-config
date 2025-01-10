vim.g.mapleader = " "
vim.opt.clipboard = "unnamedplus" -- copy/paste to system clipboard
vim.opt.swapfile = false -- don't create swap files
vim.opt.showmode = false -- don't show mode on cmd line, we have statusline for that
vim.opt.laststatus = 3 -- global statusline
vim.opt.signcolumn = "yes" -- always show sign column
vim.opt.termguicolors = true -- enable true colors
vim.opt.timeoutlen = 400 -- time to wait for a mapped sequence to complete
vim.opt.undofile = true -- persistent undo
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.updatetime = 250 -- interval for writing swap file to disk, also used by gitsigns
vim.opt.cursorline = true

-- Folding
vim.opt.foldlevel = 20
vim.opt.foldmethod = "expr"
vim.opt.foldtext = ""
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Spell
vim.opt.spell = true
vim.opt.spelllang = "en_us"

-- Indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Numbers
vim.opt.number = true
vim.opt.ruler = false
vim.opt.relativenumber = true
