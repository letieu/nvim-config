return {
  { "neovim/nvim-lspconfig" },
  { "lukas-reineke/indent-blankline.nvim", config = true, main = "ibl", },
  { "windwp/nvim-autopairs",               config = true },
  { "numToStr/Comment.nvim",               config = true },
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
    "letieu/harpoon-lualine",
    dependencies = { "nvim-lualine/lualine.nvim", {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
    } },
  }
}
