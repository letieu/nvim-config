local group = vim.api.nvim_create_augroup("UserConfig", {})

-- blink yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 150 }
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "dart",
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "sql",
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.commentstring = "-- %s"
    vim.keymap.set('n', '<leader>r', ':normal vip<CR><PLUG>(DBUI_ExecuteQuery)', { buffer = true })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "go",
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.softtabstop = 4
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  group = group,
  pattern = "hyprlang",
  callback = function()
    vim.bo.commentstring = "# %s"
  end,
})
