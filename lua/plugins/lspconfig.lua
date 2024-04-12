local servers = {
  "html",
  "cssls",
  "eslint",
  "lua_ls",
  "solidity",
  "dockerls",
  "gopls",
  "tsserver",
  "intelephense",
  "ansiblels",
  "dartls",
  { "rust_analyzer", config = { settings = { ["rust-analyzer"] = { checkOnSave = { command = "clippy" } } } } },
}

return {
  "neovim/nvim-lspconfig",
  event = { "BufRead" },
  config = function()
    local lspconfig = require "lspconfig"
    local capabilities = require("helper.lsp").capabilities

    for _, lsp in ipairs(servers) do
      local config = { capabilities = capabilities }
      local name = lsp

      if type(lsp) == "table" then
        name = lsp[1]
        config = vim.tbl_deep_extend("force", config, lsp.config)
      end

      lspconfig[name].setup(config)
    end

    -- attach lsp keymaps
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(args)
        local on_lsp_attach = require("helper.lsp").on_attach
        on_lsp_attach(args.data.client_id, args.buf)
      end,
    })
  end,
}
