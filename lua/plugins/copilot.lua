require('copilot').setup({
  panel = {
    enabled = false, -- use cmp
    auto_refresh = false,
    -- Mapping
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
  },
  suggestion = {
    enabled = false, -- use cmp
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<C-f>",
      next = "<M-down>",
      prev = "<M-up",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = true,
    markdown = true,
    help = false,
    gitcommit = true,
    gitrebase = true,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = 'node', -- Node version must be < 18
  server_opts_overrides = {},
})

require('copilot_cmp').setup()
