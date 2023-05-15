local M = {}
local map = vim.keymap.set
local navbuddy = require("nvim-navbuddy")
local navic = require("nvim-navic")

local mapping = function()
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  map('n', 'gD', vim.lsp.buf.declaration, bufopts)
  map('n', 'gd', vim.lsp.buf.definition, bufopts)
  map('n', 'K', vim.lsp.buf.hover, bufopts)
  map('n', 'gi', vim.lsp.buf.implementation, bufopts)
  map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  map('n', '<leader>ra', vim.lsp.buf.rename, bufopts)
  map('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)

  map('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  map('n', 'gr', vim.lsp.buf.references, bufopts)

  map('n', '<leader>fm', function()
    vim.lsp.buf.format { async = true }
  end, bufopts)

  map('n', '<leader>f', vim.diagnostic.open_float, bufopts)
  map('n', '[d', vim.diagnostic.goto_prev, bufopts)
  map('n', ']d', vim.diagnostic.goto_next, bufopts)

  -- lua require("nvim-navbuddy").open()
  map('n', '<leader>n', navbuddy.open, bufopts)
end

M.on_attach = function(client, bufnr)
  mapping()
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

return M
