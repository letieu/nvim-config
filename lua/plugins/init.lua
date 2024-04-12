return {
  { "rafcamlet/nvim-luapad", cmd = { "Luapad" } },
  { "folke/neodev.nvim", opts = {}, ft = { "lua" } },
  { "windwp/nvim-autopairs", config = true, event = { "InsertEnter" } },
  { "j-hui/fidget.nvim", config = true, event = { "BufRead" } },
  { "stevearc/dressing.nvim", config = true, event = { "LspAttach" } },
  { "wintermute-cell/gitignore.nvim", cmd = { "Gitignore" } },
  { "akinsho/git-conflict.nvim", config = true, version = "*", event = { "BufRead" } },
  { "dmmulroy/tsc.nvim", config = true, cmd = { "TSC" } },
  { "folke/todo-comments.nvim", config = true, event = "BufRead" },
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
