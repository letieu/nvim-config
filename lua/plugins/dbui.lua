return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod',                     lazy = true },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
  end,
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("VimDadbodUserConfig", {}),
      pattern = "sql",
      callback = function()
        vim.bo.tabstop = 4
        vim.bo.commentstring = "-- %s"
        vim.keymap.set('n', '<leader>r', ':normal vip<CR><PLUG>(DBUI_ExecuteQuery)', { buffer = true })
      end,
    })
  end
}
