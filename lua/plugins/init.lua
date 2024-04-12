return {
  { "folke/neodev.nvim", opts = {}, ft = { "lua" } },
  { "windwp/nvim-autopairs", config = true, event = { "InsertEnter" } },
  { "j-hui/fidget.nvim", config = true, event = { "BufRead" } },
  { "wintermute-cell/gitignore.nvim", cmd = { "Gitignore" } },
  { "ellisonleao/carbon-now.nvim", lazy = true, cmd = "CarbonNow", opts = { open_cmd = "open" } },
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
