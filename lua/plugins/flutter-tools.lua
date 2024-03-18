return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local on_attach = require("lsp.utils").on_attach
    local capabilities = require("lsp.utils").capabilities

    require("flutter-tools").setup {
      widget_guides = {
        enabled = true,
      },
      dev_log = {
        enabled = true,
        notify_errors = true,
      },
      dev_tools = {
        autostart = false,
        auto_open_browser = false,
      },
      lsp = {
        on_attach = on_attach,
        capabilities = capabilities,
      },
    }
  end,
}
