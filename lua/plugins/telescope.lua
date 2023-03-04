local builtin = require('telescope.builtin')

-- Mapping
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

vim.keymap.set('n', '<leader>fa', function()
  builtin.find_files({ hidden = true, follow = true, no_ignore = true })
end, {})

vim.keymap.set('n', '<leader>fw', builtin.live_grep, {})

vim.keymap.set('n', '<leader>fd', builtin.diagnostics, {})

vim.keymap.set('n', '<leader>fy', ":Telescope neoclip<CR>", {})
