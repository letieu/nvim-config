return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  config = true,
  keys = {
    {
      "<leader>gh",
      function()
        require("gitsigns").preview_hunk()
      end,
      desc = "Gitsigns preview hunk",
    },
    {
      "<leader>gr",
      function()
        require("gitsigns").reset_hunk()
      end,
      desc = "Gitsigns reset hunk",
    },
    {
      "<leader>gb",
      function()
        require("gitsigns").blame_line()
      end,
      desc = "Gitsigns blame line",
    },
  },
}
