return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim"
  },
  config = function()
    local lspconfig = require "lspconfig"
    local mason_registry = require('mason-registry')
    local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() ..
        '/node_modules/@vue/language-server'

    local servers = {
      "templ",
      "html",
      "cssls",
      "eslint",
      "lua_ls",
      "solidity",
      "dockerls",
      "gopls",
      "intelephense",
      "ansiblels",
      "dartls",
      "pylsp",
      "pbls",
      "volar",
      "prismals",
      {
        "rust_analyzer",
        config = {
          settings = {
            ["rust-analyzer"] = {
              checkOnSave = {
                command = "clippy",
              },
            },
          },
        },
      },
      {
        "ts_ls",
        config = {
          settings = {
            typescript = {
              preferences = {
                importModuleSpecifier = "project-relative"
              }
            }
          },
          init_options = {
            plugins = {
              {
                name = '@vue/typescript-plugin',
                location = vue_language_server_path,
                languages = { 'vue' },
              },
            },
          },
          filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
        }
      }
    }

    for _, lsp in ipairs(servers) do
      -- local config = { capabilities = capabilities }
      local config = {}
      local name = lsp

      if type(lsp) == "table" then
        name = lsp[1]
        config = vim.tbl_deep_extend("force", config, lsp.config)
      end

      lspconfig[name].setup(config)
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(args)
        local on_lsp_attach = require("helper.lsp").on_attach
        on_lsp_attach(args.data.client_id, args.buf)
      end,
    })

    -- auto install lsp server
    require("mason-lspconfig").setup()
  end,
}
