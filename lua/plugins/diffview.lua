return {
  "sindrets/diffview.nvim",
  config = function()
    require "plugins.diffview"
  end,
  opts = {},
  cmd= {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewFileHistory",
  },
  keys = {
    {
      "<leader>do",
      function()
        require("diffview").open()
      end,
      desc = "Diffview open",
    },
    {
      "<leader>dl",
      function()
        vim.cmd("DiffviewFileHistory %")
      end,
      desc = "Diffview current file history",
    },
    {
      "<leader>dL",
      function()
        require("diffview").file_history {}
      end,
      desc = "Diffview file history (all)",
    },
    {
      "<leader>dc",
      function()
        require("diffview").close()
      end,
      desc = "Diffview close",
    },
  },
}
