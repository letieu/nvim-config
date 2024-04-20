-- This file for some plugins that don't need custom configuration, just install and use it with 1 line of code
-- For plugins that need custom configuration, create a new file in lua/plugins/
return {
  { "folke/neodev.nvim", opts = {}, ft = { "lua" } },
  { "windwp/nvim-autopairs", config = true, event = { "InsertEnter" } },
  { "j-hui/fidget.nvim", config = true, event = { "VeryLazy" } },
  { "ellisonleao/carbon-now.nvim", lazy = true, cmd = "CarbonNow", opts = { open_cmd = "open" } },
}
