return {
  "letieu/jot.lua",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
  },
  keys = {
    {
      "<leader>fj",
      function()
        require("jot").toggle()
      end,
      desc = "Jot - Toggle",
    },
  },
}
