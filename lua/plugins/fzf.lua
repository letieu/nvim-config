return {
  "ibhagwan/fzf-lua",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local config = require("helper/fzf-config")

    require("fzf-lua").setup(config)
    require("fzf-lua").register_ui_select()
  end,
  keys = {
    {
      "<leader>ff",
      function()
        require("fzf-lua").files()
      end,
      desc = "Find files",
    },
    {
      "<leader>fw",
      function()
        require("fzf-lua").live_grep()
      end,
      desc = "Fzf live grep",
    },
    {
      "<leader>fd",
      function()
        require("fzf-lua").diagnostics_document()
      end,
      desc = "Fzf diagnostics",
    },
    {
      "<leader>fD",
      function()
        require("fzf-lua").diagnostics_workspace()
      end,
      desc = "Fzf workspace diagnostics",
    },
    {
      "<leader>gs",
      function()
        require("fzf-lua").git_status()
      end,
      desc = "Fzf git status",
    },
  },
}
