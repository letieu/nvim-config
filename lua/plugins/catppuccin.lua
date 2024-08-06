return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      custom_highlights = function(colors)
        return {
          GitGraphHash = { fg = colors.peach },
          GitGraphTimestamp = { fg = colors.pink },
          GitGraphAuthor = { fg = colors.sky },
          GitGraphBranchName = { fg = colors.red },
          GitGraphBranchTag = { fg = colors.teal },
          GitGraphBranchMsg = { fg = colors.text },

          GitGraphBranch1 = { fg = colors.pink },
          GitGraphBranch2 = { fg = colors.blue },
          GitGraphBranch3 = { fg = colors.green },
          GitGraphBranch4 = { fg = colors.yellow },
          GitGraphBranch5 = { fg = colors.red },
        }
      end
    })
    vim.cmd.colorscheme "catppuccin-latte"
    -- vim.cmd.colorscheme "catppuccin-mocha"
  end
}
