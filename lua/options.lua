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
-- vim.opt.cursorline = true

-- Folding
vim.opt.foldlevel = 20
vim.opt.foldenable = true
vim.opt.foldmethod = "expr"
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

-- disable some builtin vim plugins
local default_disable_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "syntax",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}

for _, plugin in pairs(default_disable_plugins) do
  vim.g["loaded_" .. plugin] = 1
end

local default_disable_providers = {
  "node",
  "perl",
  "python3",
  "ruby",
}

for _, provider in ipairs(default_disable_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end
