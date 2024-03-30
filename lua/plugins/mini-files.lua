return {
  "echasnovski/mini.files",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = false,
  config = true,
  keys = {
    {
      "<leader>fe",
      function()
        MiniFiles.open()
      end,
      desc = "undo history",
    },
  },
}
