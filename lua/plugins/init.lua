return {
  { "neovim/nvim-lspconfig" },
  { "rafcamlet/nvim-luapad" },
  { "folke/neodev.nvim", opts = {} },
  { "windwp/nvim-autopairs", config = true },
  { "chentoast/marks.nvim", config = true },
  { "j-hui/fidget.nvim", config = true },
  { "kevinhwang91/nvim-hlslens", config = true },
  { "stevearc/dressing.nvim", config = true },
  { "wintermute-cell/gitignore.nvim" },
  { "yioneko/nvim-vtsls" },
  { "akinsho/git-conflict.nvim", config = true, version = "*" },
  { "dmmulroy/tsc.nvim", config = true },
  { "folke/todo-comments.nvim", config = true, event = "VimEnter" },
  { "kevinhwang91/nvim-bqf" },
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
  {
    "ellisonleao/carbon-now.nvim",
    lazy = true,
    cmd = "CarbonNow",
    opts = {
      open_cmd = "open",
    },
  },
  {
    "letieu/jot.lua",
    keys = {
      {
        "<leader>fj",
        function()
          require("jot").toggle()
        end,
        desc = "Jot - Toggle",
      },
    },
  },
}
