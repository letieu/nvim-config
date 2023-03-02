local M = {}
local map = vim.keymap.set

M.on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- Mapping
  map('n', 'gD', vim.lsp.buf.declaration, bufopts)
  map('n', 'gd', vim.lsp.buf.definition, bufopts)
  map('n', 'K', vim.lsp.buf.hover, bufopts)
  map('n', 'gi', vim.lsp.buf.implementation, bufopts)
  map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  map('n', '<leader>ra', vim.lsp.buf.rename, bufopts)
  map('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)

  -- map('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  -- map('n', 'gr', vim.lsp.buf.references, bufopts)
  map('n', '<leader>ca', "<cmd>Lspsaga code_action<CR>", bufopts)
  map('n', 'gr', "<cmd>Lspsaga lsp_finder<CR>", bufopts)

  map('n', '<leader>fm', function()
    vim.lsp.buf.format { async = true }
  end, bufopts)

  -- map('n', '<leader>f', vim.diagnostic.open_float, bufopts)
  -- map('n', '[d', vim.diagnostic.goto_prev, bufopts)
  -- map('n', ']d', vim.diagnostic.goto_next, bufopts)
  map('n', '<leader>f', "<cmd>Lspsaga show_line_diagnostics<CR>", bufopts)
  map('n', '[d', "<cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
  map('n', ']d', "<cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
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
