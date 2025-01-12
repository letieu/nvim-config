---@type vim.keymap.set.Opts
local nore_and_silent = {
  noremap = true,
  silent = true,
}

vim.keymap.set("n", "<ESC>", ":noh<CR>", nore_and_silent)
vim.keymap.set("n", "<leader>w", ":w<CR>", nore_and_silent)
vim.keymap.set("n", "<leader>f", vim.diagnostic.open_float, nore_and_silent)
vim.keymap.set("n", "[q", ":cprev<CR>", nore_and_silent)
vim.keymap.set("n", "]q", ":cnext<CR>", nore_and_silent)
vim.keymap.set("n", "[t", ":tabprev<CR>", nore_and_silent)
vim.keymap.set("n", "]t", ":tabnext<CR>", nore_and_silent)
vim.keymap.set("n", "<leader>mc", ":delmarks a-z<CR>", nore_and_silent)
