return {
  "stevearc/oil.nvim",
  opts = {
    keymaps = {
      ["<C-y>"] = "actions.yank_entry",
    }
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "<leader>o",
      function()
        require("oil").open()
      end,
      desc = "Oil - Open",
    },
  },
}
