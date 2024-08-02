return {
  desc = "fzf-lua defaults with `sk` as binary",
  fzf_bin = "sk",
  fzf_opts = { ["--no-separator"] = false },

  lsp = {
    code_actions = {
      previewer = false,
      winopts = { win_height = 0.5, win_width = 0.5 },
    },
  },
}
