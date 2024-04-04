return {
  "cbochs/grapple.nvim",
  opts = {
    scope = "git",
    icons = true,
    status = true,
    quick_select = "asqw",
  },
  keys = {
    { "<leader>a", "<cmd>Grapple toggle<cr>", desc = "Tag a file" },
    { "<leader>h", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },

    { ";a", "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
    { ";s", "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
    { ";q", "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
    { ";w", "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },
  },
}
