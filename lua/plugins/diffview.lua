return {
  "esmuellert/vscode-diff.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  branch = 'next',
  config = function()
    require('vscode-diff').setup({
    })
  end,
  lazy = false,
  keys = {
    {
      "<leader>do",
      ":CodeDiff<CR>",
      desc = "Diffview - Open",
    },
    {
      "<leader>dc",
      ":tabclose<CR>",
      desc = "Diffview - Close",
    },
    {
      "<leader>fh",
      function()
        require("fzf-lua").git_bcommits()
      end,
    }
  },
}
