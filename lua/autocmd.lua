-- blink yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('yank_highlight', {}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 150 }
  end,
})

-- Save last nvim server id when nvim loses focus (FocusLost)
vim.api.nvim_create_autocmd('FocusLost', {
  group = vim.api.nvim_create_augroup('focus_lost', {}),
  pattern = '*',
  callback = function()
    local servername = vim.v.servername
    vim.fn.writefile({ servername }, '/tmp/nvim-focuslost')
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(args)
    local on_lsp_attach = require("lsp.utils").on_attach
    on_lsp_attach(args.data.client_id, args.buf)
  end,
})
