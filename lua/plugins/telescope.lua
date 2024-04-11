return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = true,
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Telescope find files",
    },
    {
      "<leader>fa",
      function()
        require("telescope.builtin").find_files { hidden = true, follow = true, no_ignore = true }
      end,
      desc = "Telescope find files (all)",
    },
    {
      "<leader>fw",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Telescope live grep",
    },
    {
      "<leader>fd",
      function()
        require("telescope.builtin").diagnostics()
      end,
      desc = "Telescope diagnostics",
    },
    {
      "<leader>ft",
      function()
        require("telescope.builtin").todo { keywords = { "TODO", "FIXME", "HACK" } }
      end,
      desc = "Telescope todo",
    },
    {
      "<leader>gs",
      function()
        require("telescope.builtin").git_status { theme = "ivy" }
      end,
      desc = "Telescope git status",
    },
  },
}
