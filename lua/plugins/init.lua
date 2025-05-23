-- This file for some plugins that don't need custom configuration, just install and use it with 1 line of code
-- For plugins that need custom configuration, create a new file in lua/plugins/
return {
  { "windwp/nvim-autopairs",       config = true, event = { "InsertEnter" } },
  { "williamboman/mason.nvim",     config = true, event = { "VeryLazy" } },
  { 'akinsho/git-conflict.nvim',   config = true },
  { "xzbdmw/colorful-menu.nvim",   config = true, event = { "InsertEnter" } },
  { "norcalli/nvim-colorizer.lua", config = true },
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
  },
}
