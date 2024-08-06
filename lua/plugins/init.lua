-- This file for some plugins that don't need custom configuration, just install and use it with 1 line of code
-- For plugins that need custom configuration, create a new file in lua/plugins/
return {
  { "folke/neodev.nvim",         opts = {},              ft = { "lua" } },
  { "windwp/nvim-autopairs",     config = true,          event = { "InsertEnter" } },
  { "j-hui/fidget.nvim",         config = true,          event = { "VeryLazy" } },
  { "folke/todo-comments.nvim",  event = { "VeryLazy" }, config = true },
  { "williamboman/mason.nvim",   event = { "VeryLazy" }, config = true },
  { 'akinsho/git-conflict.nvim', version = "*",          config = true },
}
