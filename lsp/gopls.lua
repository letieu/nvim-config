---@type vim.lsp.Config
return {
  cmd = { 'gopls' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
  root_markers = { 'go.mod', 'go.work', '.git' },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
        nilness = true,
        unusedwrite = true,
        useany = true,
      },
      staticcheck = true,
      gofumpt = true,
      completeUnimported = true,
      usePlaceholders = true,
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      codelenses = {
        generate = true,
        regenerate_cgo = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
      },
    },
  },
  on_attach = function(client, bufnr)
    local function organize_imports()
      local params = vim.lsp.util.make_range_params(0, client.offset_encoding)
      params.context = { only = { 'source.organizeImports' } }
      local result = vim.lsp.buf_request_sync(bufnr, 'textDocument/codeAction', params, 1000)
      for _, res in ipairs(result or {}) do
        for _, action in ipairs(res.result or {}) do
          if action.edit then
            vim.lsp.util.apply_workspace_edit(action.edit, client.offset_encoding)
          end
        end
      end
    end

    vim.api.nvim_buf_create_user_command(bufnr, 'LspGoOrganizeImports', organize_imports, {
      desc = 'Organize Go imports',
    })

    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      group = vim.api.nvim_create_augroup('gopls_format_' .. bufnr, { clear = true }),
      callback = function()
        organize_imports()
        vim.lsp.buf.format({ bufnr = bufnr, async = false })
      end,
    })
  end,
}
