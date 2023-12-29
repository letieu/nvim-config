local on_attach = require("lsp.utils").on_attach
local capabilities = require("lsp.utils").capabilities

local lspconfig = require "lspconfig"

require("lspconfig.configs").vtsls = require("vtsls").lspconfig

local servers = {
  "html",
  "cssls",
  "eslint",
  "lua_ls",
  "solidity",
  "dockerls",
  "gopls",
  "vtsls",
  {
    "rust_analyzer",
    config = {
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = {
            command = "clippy",
          },
        },
      }
    }
  },
}

for _, lsp in ipairs(servers) do
  local config = { on_attach = on_attach, capabilities = capabilities }
  local name = lsp;

  if type(lsp) == "table" then
    name = lsp[1]
    config = vim.tbl_deep_extend("force", config, lsp.config)
  end

  lspconfig[name].setup(config)
end
