local M = {}
local map = vim.keymap.set
local navbuddy = require("nvim-navbuddy")

local mapping = function(bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  map('n', 'gD', vim.lsp.buf.declaration, bufopts)
  map('n', 'gd', vim.lsp.buf.definition, bufopts)
  map('n', 'K', vim.lsp.buf.hover, bufopts)
  map('n', 'gi', vim.lsp.buf.implementation, bufopts)
  map('n', '<leader>ra', vim.lsp.buf.rename, bufopts)
  map('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)

  map('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  map('n', '<leader>cl', vim.lsp.codelens.run, bufopts)
  map('n', 'gr', vim.lsp.buf.references, bufopts)

  map('n', '<leader>fm', function()
    vim.lsp.buf.format { async = true }
  end, bufopts)

  map('n', '<leader>f', vim.diagnostic.open_float, bufopts)
  map('n', '[d', vim.diagnostic.goto_prev, bufopts)
  map('n', ']d', vim.diagnostic.goto_next, bufopts)

  map('n', '<leader>n', navbuddy.open, bufopts)
end

local function setup_codelens_refresh(client, bufnr)
  local status_ok, codelens_supported = pcall(function()
    return client.supports_method "textDocument/codeLens"
  end)
  if not status_ok or not codelens_supported then
    return
  end
  local group = "lsp_code_lens_refresh"
  local cl_events = { "BufEnter", "InsertLeave" }
  local ok, cl_autocmds = pcall(vim.api.nvim_get_autocmds, {
    group = group,
    buffer = bufnr,
    event = cl_events,
  })

  if ok and #cl_autocmds > 0 then
    return
  end
  vim.api.nvim_create_augroup(group, { clear = false })
  vim.api.nvim_create_autocmd(cl_events, {
    group = group,
    buffer = bufnr,
    callback = vim.lsp.codelens.refresh,
  })
end

M.on_attach = function(client, bufnr)
  mapping(bufnr)
  setup_codelens_refresh(client, bufnr)
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
