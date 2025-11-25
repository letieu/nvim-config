return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup {
      formatters_by_ft = {
        html = { "prettier" },
        css = { "prettier" },
        lua = { "stylua" },
        javascript = { "prettier", "eslint_d", stop_after_first = true },
        typescript = { "prettier", "eslint_d", stop_after_first = true },
        typescriptreact = { "prettier", "eslint_d", stop_after_first = true },
        vue = { "prettier", "eslint_d" },
        python = { "isort", "black" },
        json = { "jq" },
        yaml = { "yq" },
        dart = { "dartfmt" },
        sql = { "sqlfmt" },
        go = { "gofmt", "goimports" },
        nix = { "nixpkgs-fmt" },
        xml = { "xmllint" },
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
