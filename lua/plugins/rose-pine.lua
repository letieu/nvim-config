return {
  "rose-pine/neovim",
  name = "rose-pine",
  config = function()
    require("rose-pine").setup({
      enable = {
        legacy_highlights = false
      },
      styles = {
        bold = true,
        italic = false,
        transparency = false,
      },
    })

    vim.cmd("colorscheme rose-pine")
  end
}
