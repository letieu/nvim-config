local map = vim.keymap.set
local nore_and_silent = { noremap = true, silent = true }

map('n', '<C-h>', '<C-w>h', { silent = true })
map('n', '<C-l>', '<C-w>l', { silent = true })
map('n', '<C-j>', '<C-w>j', { silent = true })
map('n', '<C-k>', '<C-w>k', { silent = true })

map('n', '<leader>f', vim.diagnostic.open_float, nore_and_silent)
map('n', '[d', vim.diagnostic.goto_prev, nore_and_silent)
map('n', ']d', vim.diagnostic.goto_next, nore_and_silent)
