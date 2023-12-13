local map = vim.keymap.set
local nore_and_silent = { noremap = true, silent = true }
local builtin = require('telescope.builtin')

-- ==================== General ====================
map('n', '<ESC>', ':noh<CR>', nore_and_silent)
map('n', '<leader>s', ':w<CR>', nore_and_silent)

-- ==================== Window ====================
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
-- moving between splits
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
-- swapping buffers between windows
vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)

-- ==================== Diagnostic ====================
map('n', '<leader>f', vim.diagnostic.open_float, nore_and_silent)
map('n', '[d', vim.diagnostic.goto_prev, nore_and_silent)
map('n', ']d', vim.diagnostic.goto_next, nore_and_silent)

-- ==================== Telescope ====================
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fa', function()
  builtin.find_files({ hidden = true, follow = true, no_ignore = true })
end, {})
vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>ft', ":TodoTelescope keywords=TODO,FIX,FIXME,HACK <CR>", {})

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
-- keymap for plugins in lua/plugins
-- search keyword: "Mapping"
