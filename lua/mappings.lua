local map = vim.keymap.set
local nore_and_silent = { noremap = true, silent = true }

-- ==================== General ====================
map("n", "<ESC>", ":noh<CR>", nore_and_silent)
map("n", "<leader>w", ":w<CR>", nore_and_silent)

-- ==================== Diagnostic ====================
map("n", "<leader>f", vim.diagnostic.open_float, nore_and_silent)
map("n", "[d", vim.diagnostic.goto_prev, nore_and_silent)
map("n", "]d", vim.diagnostic.goto_next, nore_and_silent)

-- ==================== Quickfix ====================
map("n", "[q", ":cprev<CR>", nore_and_silent) -- previous quickfix
map("n", "]q", ":cnext<CR>", nore_and_silent) -- next quickfix
