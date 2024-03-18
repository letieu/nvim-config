return {
  { "neovim/nvim-lspconfig" },
  { "windwp/nvim-autopairs", config = true },
  { "lewis6991/gitsigns.nvim", config = true },
  { "chentoast/marks.nvim", config = true },
  { "j-hui/fidget.nvim", config = true },
  { "kevinhwang91/nvim-hlslens", config = true },
  { "stevearc/dressing.nvim", config = true },
  { "wintermute-cell/gitignore.nvim" },
  { "yioneko/nvim-vtsls" },
  { "echasnovski/mini.indentscope", config = "true" },
  { "akinsho/git-conflict.nvim", config = true, version = "*" },
  { "dmmulroy/tsc.nvim", config = true },
  { "folke/todo-comments.nvim", config = true, event = "VimEnter" },
  {
    "mrjones2014/smart-splits.nvim",
    opts = {
      disable_multiplexer_nav_when_zoomed = false,
    },
  },
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = { enable_autocmd = false },
  },
}
