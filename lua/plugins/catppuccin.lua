return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    local flavour = "latte"

    local apple_interface_style = vim.fn.system("defaults read -g AppleInterfaceStyle")
    if apple_interface_style == "Dark\n" then
      flavour = "mocha"
    end

    require("catppuccin").setup({
      flavour = flavour,
    })

    vim.cmd("colorscheme catppuccin-" .. flavour)
  end
}
