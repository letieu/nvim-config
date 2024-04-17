return {
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
}
