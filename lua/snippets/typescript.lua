local ls = require "luasnip"

local s = ls.snippet
local i = ls.insert_node

local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets("typescript", {
  s("cl", fmta("console.log(<finish>)", {
    finish = i(0),
  })),

  s("if", fmta([[
if (<condition>) {
  <finish>
}
]], {
    condition = i(1),
    finish = i(0),
  })),

  s("tc", fmta([[
try {
  <finish>
} catch (error) {
}
]], {
    finish = i(0),
  })),

  s("tcf", fmta([[
try {
    <finish>
} catch (error) {
} finally {
}
]], {
    finish = i(0),
  })),

})
