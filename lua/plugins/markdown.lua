return {
  'MeanderingProgrammer/markdown.nvim',
  dependencies = { 'nvim-treesitter' },
  config = function()
    require('render-markdown').setup({
    })
  end,
}
