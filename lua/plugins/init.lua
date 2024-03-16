return {
  { "neovim/nvim-lspconfig" },
  { "lukas-reineke/indent-blankline.nvim", config = true, main = "ibl", },
  { "windwp/nvim-autopairs",               config = true },
  { "lewis6991/gitsigns.nvim",             config = true },
  { "chentoast/marks.nvim",                config = true },
  { "folke/todo-comments.nvim",            config = true },
  { "j-hui/fidget.nvim",                   config = true },
  { "kevinhwang91/nvim-hlslens",           config = true },
  { "stevearc/dressing.nvim",              config = true },
  { "karb94/neoscroll.nvim",               config = true },
  { "wintermute-cell/gitignore.nvim" },
  { 'mrjones2014/smart-splits.nvim',       config = true },
  { "yioneko/nvim-vtsls" },
  { 'akinsho/git-conflict.nvim',           config = true, version = "*" },
  { "dmmulroy/tsc.nvim",                   config = true },
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = { enable_autocmd = false }
  },
  {
    "letieu/harpoon-lualine",
    dependencies = {
      {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
      }
    },
  }
}
