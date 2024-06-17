return {
  "kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  cmd = { "Dbee" },
  build = function()
    require("dbee").install()
  end,
  config = function()
    require("dbee").setup( --[[optional config]])
  end,
}
