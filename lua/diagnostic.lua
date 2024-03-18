vim.diagnostic.config {
  virtual_text = {
    source = "if_many",
    prefix = "● ",
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    source = "if_many",
  },
}

local signs = { Error = "", Warn = "", Info = "", Hint = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
