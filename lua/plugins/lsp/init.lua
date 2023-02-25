local on_attach = require("plugins.lsp.utils").on_attach
local capabilities = require("plugins.lsp.utils").capabilities

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "tsserver", "eslint", "rust_analyzer", "lua_ls", "solidity" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
