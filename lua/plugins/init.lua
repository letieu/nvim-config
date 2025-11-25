-- This file for some plugins that don't need custom configuration, just install and use it with 1 line of code
-- For plugins that need custom configuration, create a new file in lua/plugins/
return {
  { "windwp/nvim-autopairs",       config = true,              event = { "InsertEnter" } },
  { 'akinsho/git-conflict.nvim',   config = true },
  { "mason-org/mason.nvim",        opts = {} },
  { "norcalli/nvim-colorizer.lua", cmd = { "ColorizerToggle" } },
  {
    "mistweaverco/kulala.nvim",
    ft = { "http", "rest" },
    opts = { global_keymaps = true },
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup()
      vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
    end,
  },
}
