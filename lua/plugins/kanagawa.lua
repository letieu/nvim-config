return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  config = function()
    require('kanagawa').setup({
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none"
            }
          }
        }
      },
      overrides = function(colors)
        local theme = colors.theme
        local palette = colors.palette

        return {
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },

          GitGraphHash = { fg = palette.oldWhite },
          GitGraphTimestamp = { fg = palette.boatYellow1 },
          GitGraphAuthor = { fg = palette.autumnYellow },
          GitGraphBranchName = { fg = palette.autumnRed },
          GitGraphBranchTag = { fg = palette.autumnRed },
          GitGraphBranchMsg = { fg = palette.fujiWhite },

          GitGraphBranch1 = { fg = palette.peachRed },
          GitGraphBranch2 = { fg = palette.lightBlue },
          GitGraphBranch3 = { fg = palette.springGreen },
          GitGraphBranch4 = { fg = palette.roninYellow },
          GitGraphBranch5 = { fg = palette.rsamuraiRed },
        }
      end,
    })
    vim.cmd("colorscheme kanagawa")
  end
}
