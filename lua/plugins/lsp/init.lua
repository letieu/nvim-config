local on_attach = require("plugins.lsp.utils").on_attach
local capabilities = require("plugins.lsp.utils").capabilities
local add_bun_prefix = require("plugins.lsp.bun").add_bun_prefix

local lspconfig = require "lspconfig"
local util = require "lspconfig.util"

local servers = { "html", "cssls", "tsserver", "eslint", "rust_analyzer", "lua_ls", "solidity" }

util.on_setup = util.add_hook_before(util.on_setup, add_bun_prefix)

for _, lsp in ipairs(servers) do
  local config = { on_attach = on_attach, capabilities = capabilities }
  lspconfig[lsp].setup (config)
end
