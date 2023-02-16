local builtin = require("statuscol.builtin")
local cfg = {
  separator = true,     -- separator between line number and buffer text ("│" or extra " " padding)
  -- Builtin line number string options for ScLn() segment
  thousands = false,     -- or line number thousands separator string ("." / ",")
  relculright = false,   -- whether to right-align the cursor line number with 'relativenumber' set
  -- Custom line number string options for ScLn() segment
  lnumfunc = nil,        -- custom function called by ScLn(), should return a string
  -- Custom fold column string options for ScFc() segment
  foldfunc = "builtin",        -- nil for "%C" segment, "builtin" for builtin function, or custom function
                         -- called by ScFc(), should return a string
  -- Builtin 'statuscolumn' options
  setopt = false,        -- whether to set the 'statuscolumn', providing builtin click actions
  order = "FSNs",        -- order of the fold, sign, line number and separator segments
  ft_ignore = nil,       -- lua table with filetypes for which 'statuscolumn' will be unset
  -- Click actions
  Lnum                   = builtin.lnum_click,
  FoldClose              = builtin.foldclose_click,
  FoldOpen               = builtin.foldopen_click,
  FoldOther              = builtin.foldother_click,
  DapBreakpointRejected  = builtin.toggle_breakpoint,
  DapBreakpoint          = builtin.toggle_breakpoint,
  DapBreakpointCondition = builtin.toggle_breakpoint,
  DiagnosticSignError    = builtin.diagnostic_click,
  DiagnosticSignHint     = builtin.diagnostic_click,
  DiagnosticSignInfo     = builtin.diagnostic_click,
  DiagnosticSignWarn     = builtin.diagnostic_click,
  GitSignsTopdelete      = builtin.gitsigns_click,
  GitSignsUntracked      = builtin.gitsigns_click,
  GitSignsAdd            = builtin.gitsigns_click,
  GitSignsChangedelete   = builtin.gitsigns_click,
  GitSignsDelete         = builtin.gitsigns_click,
}

require("statuscol").setup(cfg)
