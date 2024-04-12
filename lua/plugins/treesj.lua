return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("treesj").setup {
      use_default_keymaps = false,
    }
  end,
  keys = {
    {
      "<leader>mm",
      function()
        require("treesj").toggle()
      end,
      desc = "Treesj - Toggle",
    },
  },
}
