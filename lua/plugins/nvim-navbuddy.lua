return {
  "SmiteshP/nvim-navbuddy",
  dependencies = { "neovim/nvim-lspconfig", "SmiteshP/nvim-navic", "MunifTanjim/nui.nvim" },
  opts = {
    lsp = { auto_attach = true },
  },
  keys = {
    {
      "<leader>n",
      function()
        require("navbuddy").open()
      end,
      desc = "NavBuddy - Open",
    },
  },
}
