return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { { "eslint_d", "prettierd", "prettier" } },
      typescript = { { "eslint_d", "prettierd", "prettier" } },
      python = { "isort", "black" },
    },
  },
}
