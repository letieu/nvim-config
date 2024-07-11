local ls = require "luasnip"

local s = ls.snippet
local i = ls.insert_node

local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets("typescriptreact", {
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

  s("ust", fmta([[
const [<var>, <setVar>] = useState(<finish>)
]], {
    var = i(1),
    setVar = i(2),
    finish = i(0),
  })),

  s("edf", fmta([[
export default function <name>(<params>) {
  <finish>
}
]], {
    name = i(1),
    params = i(2),
    finish = i(0),
  })),

  s("cln", fmta([[
className="<finish>"
]], {
    finish = i(0),
  })),
})
