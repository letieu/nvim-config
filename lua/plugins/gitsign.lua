return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  config = true,
  keys = {
    {
      "<leader>ghv",
      function()
        require("gitsigns").preview_hunk()
      end,
      desc = "Gitsigns preview hunk",
    },
    {
      "<leader>ghr",
      function()
        require("gitsigns").reset_hunk()
        vim.notify("Hunk reset", "info", { title = "Gitsigns" })
      end,
      desc = "Gitsigns reset hunk",
    },
    {
      "]h",
      function()
        require("gitsigns").next_hunk()
      end,
    },
    {
      "[h",
      function()
        require("gitsigns").prev_hunk()
      end,
    },
    {
      "<leader>ghs",
      function()
        require("gitsigns").stage_hunk()
        vim.notify("Hunk staged", "info", { title = "Gitsigns" })
      end,
    },
    {
      "<leader>ghu",
      function()
        require("gitsigns").undo_stage_hunk()
        vim.notify("Hunk unstaged", "info", { title = "Gitsigns" })
      end,
    },
    {
      "<leader>gb",
      function()
        require("gitsigns").blame_line()
      end,
      desc = "Gitsigns blame line",
    },
    {
      "<leader>gB",
      function()
        require("gitsigns").blame()
      end,
    }
  },
}
