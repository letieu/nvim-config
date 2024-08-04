local nore_and_silent = { noremap = true, silent = true }

-- ==================== General ====================
vim.keymap.set("n", "<ESC>", ":noh<CR>", nore_and_silent)
vim.keymap.set("n", "<leader>w", ":w<CR>", nore_and_silent)

-- ==================== Diagnostic ====================
vim.keymap.set("n", "<leader>f", vim.diagnostic.open_float, nore_and_silent)

-- ==================== Quickfix ====================
vim.keymap.set("n", "[q", ":cprev<CR>", nore_and_silent)
vim.keymap.set("n", "]q", ":cnext<CR>", nore_and_silent)
vim.keymap.set("n", "<leader>q", ":copen<CR>", nore_and_silent)

-- ==================== Mark ====================
vim.keymap.set("n", "<leader>mc", ":delmarks a-z<CR>", nore_and_silent)

-- =================== Tabs ===================
vim.keymap.set("n", "[t", ":tabprev<CR>", nore_and_silent)
vim.keymap.set("n", "]t", ":tabnext<CR>", nore_and_silent)
