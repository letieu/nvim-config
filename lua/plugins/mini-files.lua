return {
  "echasnovski/mini.files",
  version = false,
  config = true,
  keys = {
    { -- lazy style key map
      "<leader>fe",
      function()
        MiniFiles.open()
      end,
      desc = "undo history",
    },
  },
}
