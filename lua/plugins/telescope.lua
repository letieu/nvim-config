return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    require("telescope").setup {}
    require("telescope").load_extension "ui-select"
  end,
  event = "LspAttach", -- For code actions
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
        vim.cmd "TodoTelescope keywords=TODO,FIX"
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
