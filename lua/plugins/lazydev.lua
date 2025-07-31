return {
  "folke/lazydev.nvim",
  ft = "lua",
  dependencies = {
    { 'justinsgithub/wezterm-types', lazy = true },
  },
  opts = {
    library = {
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      { path = 'wezterm-types',      mods = { 'wezterm' } },
    },
  },
}
