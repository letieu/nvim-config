require 'nvim-treesitter.configs'.setup {
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

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
