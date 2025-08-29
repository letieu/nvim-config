---@type vim.keymap.set.Opts
local nore_and_silent = {
  noremap = true,
  silent = true,
}

vim.keymap.set("n", "<ESC>", ":noh<CR>", nore_and_silent)
vim.keymap.set("n", "<leader>w", ":w<CR>", nore_and_silent)
vim.keymap.set("n", "<leader>f", vim.diagnostic.open_float, nore_and_silent)
vim.keymap.set("n", "<leader>mc", ":delmarks a-z<CR>", nore_and_silent)

vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, {})

vim.keymap.set("n", "<C-u>", "<C-u>zz", {})
vim.keymap.set("n", "<C-d>", "<C-d>zz", {})

vim.keymap.set("i", "<C-,>", function()
  if not vim.lsp.inline_completion.get() then
    return "<C-,>"
  end
end, {
  expr = true,
  replace_keycodes = true,
  desc = "Get the current inline completion",
})

