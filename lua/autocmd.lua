local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- blink yanked text
autocmd('TextYankPost', {
  group = augroup('yank_highlight', {}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 150 }
  end,
})

-- Save last nvim server id when nvim loses focus (FocusLost)
autocmd('FocusLost', {
  group = augroup('focus_lost', {}),
  pattern = '*',
  callback = function()
    local servername = vim.v.servername
    vim.fn.writefile({servername}, '/tmp/nvim-focuslost')
  end,
})
