return {
  "OXY2DEV/markview.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  ft = "markdown",
  config = function()
    local preset = require("helper.markview-preset")

    require("markview").setup({
      highlight_groups = preset.heading.label_hls_dark,
      headings = preset.heading.label,
      checkboxes = {
        enable = false,
      },
      code_blocks = {
        style = "minimal",
        position = "inline",

        pad_char = " ",
        pad_amount = 1,

        hl = "dark",
        min_width = 80
      },
      list_items = {
        enable = true,
        shift_amount = 2,
        marker_star = {
          add_padding = false,
          text = "•",
          hl = "rainbow5"
        },
        marker_minus = {
          add_padding = false,
          text = "•",
          hl = "rainbow5"
        }
      }
    });
  end,
}
