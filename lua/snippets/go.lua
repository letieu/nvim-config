local ls = require "luasnip"
local smart_error = require "snippets.go.smart-error"

ls.add_snippets("go", {
  smart_error,
})
