local actions = require("diffview.actions")
local map = vim.keymap.set

require("diffview").setup({
  diff_binaries = false,    -- Show diffs for binaries
  enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
  git_cmd = { "git" },      -- The git executable followed by default args.
  use_icons = true,         -- Requires nvim-web-devicons
  show_help_hints = true,   -- Show hints for how to open the help panel
  watch_index = true,       -- Update views and index buffers when the git index changes.
  icons = {                 -- Only applies when use_icons is true.
    folder_closed = "",
    folder_open = "",
  },
  signs = {
    fold_closed = "",
    fold_open = "",
    done = "✓",
  },
})

-- Mapping
map('n', '<leader>do', ':DiffviewOpen<CR>', { noremap = true, silent = true })
map('n', '<leader>dl', ':DiffviewFileHistory %<CR>', { noremap = true, silent = true })
map('n', '<leader>dL', ':DiffviewFileHistory<CR>', { noremap = true, silent = true })
map('n', '<leader>dc', ':DiffviewClose<CR>', { noremap = true, silent = true })
