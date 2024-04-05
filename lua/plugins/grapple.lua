return {
  "cbochs/grapple.nvim",
  opts = {
    scope = "git_branch",
    icons = true,
    status = true,
    quick_select = "asqw",
  },
  keys = {
    { "<leader>a", "<cmd>Grapple toggle<cr>", desc = "Tag a file" },
    { "<leader>h", "<cmd>Grapple toggle_tags<cr>", desc = "Toggle tags menu" },

    { "<c-a>", "<cmd>Grapple select index=1<cr>", desc = "Select first tag" },
    { "<c-s>", "<cmd>Grapple select index=2<cr>", desc = "Select second tag" },
    { "<c-q>", "<cmd>Grapple select index=3<cr>", desc = "Select third tag" },
    { "<c-w>", "<cmd>Grapple select index=4<cr>", desc = "Select fourth tag" },
  },
}
