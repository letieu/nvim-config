return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup {
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { { "prettier", "eslint" } },
        typescript = { { "prettier", "eslint" } },
        python = { "isort", "black" },
        json = { "jq" },
      },
    }
  end,
}
