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
  -- "dartls",
  "dockerls",
  "gopls",
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
  {
    "vtsls",
    config = {
      {
        settings = {
          typescript = {
            inlayHints = {
              parameterNames = { enabled = "literals" },
              parameterTypes = { enabled = true },
              variableTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              enumMemberValues = { enabled = true },
            }
          },
        }
      }
    }
  }
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
