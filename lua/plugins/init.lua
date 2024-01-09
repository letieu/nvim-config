return {
  { "neovim/nvim-lspconfig" },

  { "nvim-telescope/telescope.nvim",       config = true,                             dependencies = { "nvim-lua/plenary.nvim" } },

  { "ThePrimeagen/harpoon",                dependencies = { "nvim-lua/plenary.nvim" } },

  { "lukas-reineke/indent-blankline.nvim", config = true,                             main = "ibl", },

  { "windwp/nvim-autopairs",               config = true },

  { "numToStr/Comment.nvim",               config = true },

  { "lewis6991/gitsigns.nvim",             config = true },

  { "chentoast/marks.nvim",                config = true },

  { "folke/todo-comments.nvim",            config = true },

  { 'NvChad/nvim-colorizer.lua',           config = true },

  { "j-hui/fidget.nvim",                   config = true },

  { "onsails/lspkind.nvim" },

  { "kevinhwang91/nvim-hlslens",           config = true },

  { "stevearc/dressing.nvim",              config = true },

  { "karb94/neoscroll.nvim",               config = true },

  { "wintermute-cell/gitignore.nvim" },

  { 'mrjones2014/smart-splits.nvim',       config = true },

  { "yioneko/nvim-vtsls" },

  { 'chrisgrieser/nvim-recorder',          config = true },

  { 'akinsho/git-conflict.nvim',           config = true,                             version = "*" },

  { "Eandrju/cellular-automaton.nvim" },
}
