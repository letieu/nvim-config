return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "BufRead",
  config = function()
    local configs = require "nvim-treesitter.configs"

    configs.setup {
      ensure_installed = {
        "c",
        "lua",
        "gitignore",
        "gitcommit",
        "html",
        "css",
        "rust",
        "go",
        "javascript",
        "typescript",
        "markdown",
      },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}
