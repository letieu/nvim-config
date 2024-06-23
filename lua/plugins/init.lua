-- This file for some plugins that don't need custom configuration, just install and use it with 1 line of code
-- For plugins that need custom configuration, create a new file in lua/plugins/
return {
  { "folke/neodev.nvim",        opts = {},              ft = { "lua" } },
  { "windwp/nvim-autopairs",    config = true,          event = { "InsertEnter" } },
  { "j-hui/fidget.nvim",        config = true,          event = { "VeryLazy" } },
  { "folke/todo-comments.nvim", event = { "VeryLazy" }, config = true },
  { "williamboman/mason.nvim",  config = true },
  {
    'mikesmithgh/kitty-scrollback.nvim',
    enabled = true,
    lazy = true,
    cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
    event = { 'User KittyScrollbackLaunch' },
    config = function()
      require('kitty-scrollback').setup()
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme "catppuccin-latte"
      vim.cmd.colorscheme "catppuccin-mocha"
    end
  },
}
