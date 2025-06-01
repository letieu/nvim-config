return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup {
      formatters_by_ft = {
        html = { "prettier" },
        css = { "prettier" },
        json = { "jq" },
        yaml = { "yq" },
        sql = { "sqlfmt" },
      },
    }
  end,
  keys = {
    {
      "<leader>fm",
      function()
        require("conform").format { async = true, lsp_fallback = true }
      end,
      desc = "Conform format",
    },
  },
}
