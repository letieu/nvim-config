local M = {}
local map = vim.keymap.set

local mapping = function(buf)
  local bufopts = { noremap = true, silent = true, buffer = buf }

  map("n", "gD", vim.lsp.buf.declaration, bufopts)
  map("n", "gd", vim.lsp.buf.definition, bufopts)
  map("n", "K", vim.lsp.buf.hover, bufopts)
  map("n", "gi", vim.lsp.buf.implementation, bufopts)
  map("n", "<leader>ra", vim.lsp.buf.rename, bufopts)
  map("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)

  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, bufopts)

  map("n", "<leader>cl", vim.lsp.codelens.run, bufopts)
  -- map("n", "gr", vim.lsp.buf.references, bufopts)
  map("n", "gr", "<cmd>Trouble lsp_references<CR>", bufopts)
end

M.on_attach = function(client_id, buf)
  mapping(buf)
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
