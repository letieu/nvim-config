return {
  'projekt0n/github-nvim-theme',
  lazy = false,
  priority = 1001,
  config = function()
    require('github-theme').setup()
    -- vim.cmd('colorscheme github_light')
  end
}
