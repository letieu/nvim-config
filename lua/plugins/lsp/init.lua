local on_attach = require("plugins.lsp.utils").on_attach
local capabilities = require("plugins.lsp.utils").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig.util"

local servers = {
  "html",
  "cssls",
  "vtsls", -- instead of tsserver
  "eslint",
  "lua_ls",
  "solidity",
  "dartls",
  "dockerls",
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
