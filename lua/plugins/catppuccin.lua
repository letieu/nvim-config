return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    local flavour = "mocha"

    require("catppuccin").setup {
      flavour = flavour,
    }

    vim.cmd("colorscheme catppuccin-" .. flavour)
  end,
}
