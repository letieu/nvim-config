return {
  "neovim/nvim-lspconfig",
  dependencies = {
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
      prismals = {},
      rust_analyzer = {},
      bashls = {},
      zls = {},
      hls = {},
      kotlin_language_server = {},
      graphql = {
        filetypes = { "graphql" },
      },
      denols = {
        root_dir = function(fname)
          local util = require 'lspconfig.util'
          return util.root_pattern("deno.json", "deno.jsonc", "mod.ts")(fname)
        end,
      },
      ts_ls = {
        root_dir = function(fname)
          local util = require 'lspconfig.util'
          return util.root_pattern("package.json", "tsconfig.json")(fname)
        end,
        single_file_support = false,
        settings = {
          typescript = {
            preferences = {
              importModuleSpecifier = "project-relative"
            }
          }
        },
      },
    },
    mapping = function(buf)
      local bufopts = { noremap = true, silent = true, buffer = buf }
      local map = vim.keymap.set

      map("n", "gD", vim.lsp.buf.declaration, bufopts)
      map("n", "gd", vim.lsp.buf.definition, bufopts)
      map("n", "K", vim.lsp.buf.hover, bufopts)
      map("n", "gi", vim.lsp.buf.implementation, bufopts)
      map("n", "<leader>ra", vim.lsp.buf.rename, bufopts)
      map("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)

      map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, bufopts)

      map("n", "<leader>cl", vim.lsp.codelens.run, bufopts)
      map("n", "gr", vim.lsp.buf.references, bufopts)
    end
  },
  config = function(_, opts)
    local lspconfig = require('lspconfig')
    for server, config in pairs(opts.servers) do
      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(args)
        opts.mapping(args.buf)
      end,
    })
  end
}
