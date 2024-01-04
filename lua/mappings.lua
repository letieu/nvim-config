local map = vim.keymap.set
local builtin = require('telescope.builtin')
local nore_and_silent = { noremap = true, silent = true }

-- ==================== General ====================
map('n', '<ESC>', ':noh<CR>', nore_and_silent)
map('n', '<leader>s', ':w<CR>', nore_and_silent)

-- ==================== Window ====================
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
map('n', '<A-h>', require('smart-splits').resize_left)
map('n', '<A-j>', require('smart-splits').resize_down)
map('n', '<A-k>', require('smart-splits').resize_up)
map('n', '<A-l>', require('smart-splits').resize_right)
-- moving between splits
map('n', '<C-h>', require('smart-splits').move_cursor_left)
map('n', '<C-j>', require('smart-splits').move_cursor_down)
map('n', '<C-k>', require('smart-splits').move_cursor_up)
map('n', '<C-l>', require('smart-splits').move_cursor_right)
-- swapping buffers between windows
map('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
map('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
map('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
map('n', '<leader><leader>l', require('smart-splits').swap_buf_right)

-- ==================== Diagnostic ====================
map('n', '<leader>f', vim.diagnostic.open_float, nore_and_silent)
map('n', '[d', vim.diagnostic.goto_prev, nore_and_silent)
map('n', ']d', vim.diagnostic.goto_next, nore_and_silent)

-- ==================== Telescope ====================
map('n', '<leader>ff', builtin.find_files, {})
map('n', '<leader>fa', function()
  builtin.find_files({ hidden = true, follow = true, no_ignore = true })
end, {})
map('n', '<leader>fw', builtin.live_grep, {})
map('n', '<leader>fd', builtin.diagnostics, {})
map('n', '<leader>ft', ":TodoTelescope keywords=TODO,FIX,FIXME,HACK <CR>", {})
map(
  "v",
  "<leader>rr",
  "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
  { noremap = true }
)

-- ==================== Quickfix ====================
map('n', '[q', ':cprev<CR>', nore_and_silent) -- previous quickfix
map('n', ']q', ':cnext<CR>', nore_and_silent) -- next quickfix

-- ==================== Harpoon ====================
map('n', '<leader>h', require('harpoon.ui').toggle_quick_menu, {})
map('n', '<leader>a', require('harpoon.mark').add_file, {})

map('n', '<Tab>', function()
  require('harpoon.ui').nav_next(4)
end, { noremap = true })

map('n', '<S-Tab>', function()
  require('harpoon.ui').nav_prev(4)
end, { noremap = true })

-- ==================== Git ====================
map('n', '<leader>gh', ':Gitsigns preview_hunk<CR>', { noremap = true, silent = true })
map('n', '<leader>gr', ':Gitsigns reset_hunk<CR>', { noremap = true, silent = true })
map('n', '<leader>gb', ':Gitsigns blame_line<CR>', { noremap = true, silent = true })

-- ==================== Another Plugins ====================
map("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })

map('n', 'zR', require('ufo').openAllFolds)
map('n', 'zM', require('ufo').closeAllFolds)

map('n', '<leader>do', ':DiffviewOpen<CR>', { noremap = true, silent = true })
map('n', '<leader>dl', ':DiffviewFileHistory %<CR>', { noremap = true, silent = true })
map('n', '<leader>dL', ':DiffviewFileHistory<CR>', { noremap = true, silent = true })
map('n', '<leader>dc', ':DiffviewClose<CR>', { noremap = true, silent = true })
