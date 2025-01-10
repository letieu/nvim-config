return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    'saghen/blink.cmp'
  },
  opts = {
    servers = {
      templ = {},
      html = {},
      cssls = {},
      eslint = {},
      lua_ls = {},
      solidity = {},
      dockerls = {},
      gopls = {},
      intelephense = {},
      ansiblels = {},
      dartls = {},
      pylsp = {},
      pbls = {},
      volar = {},
      prismals = {},
      rust_analyzer = {},
      ts_ls = {
        settings = {
          typescript = {
            preferences = {
              importModuleSpecifier = "project-relative"
            }
          }
        },
      }
    }
  },
  config = function(_, opts)
    local lspconfig = require('lspconfig')
    for server, config in pairs(opts.servers) do
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end

    require("mason-lspconfig").setup()

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(args)
        local on_lsp_attach = require("helper.lsp").on_attach
        on_lsp_attach(args.data.client_id, args.buf)
      end,
    })
  end
}
