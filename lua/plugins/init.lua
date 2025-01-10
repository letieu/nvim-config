-- This file for some plugins that don't need custom configuration, just install and use it with 1 line of code
-- For plugins that need custom configuration, create a new file in lua/plugins/
return {
  { "folke/lazydev.nvim",        config = true, ft = "lua" },
  { "windwp/nvim-autopairs",     config = true, event = { "InsertEnter" } },
  { "williamboman/mason.nvim",   config = true, event = { "VeryLazy" } },
  { 'akinsho/git-conflict.nvim', config = true },
  { "xzbdmw/colorful-menu.nvim", config = true, event = { "InsertEnter" } },
}
