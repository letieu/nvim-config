require("harpoon").setup {}
local map = vim.keymap.set

map('n', '<leader>h', require('harpoon.ui').toggle_quick_menu, {})
map('n', '<leader>a', require('harpoon.mark').add_file, {})

map('n', '<Tab>', function()
  require('harpoon.ui').nav_next(4)
end, { noremap = true })

map('n', '<S-Tab>', function()
  require('harpoon.ui').nav_prev(4)
end, { noremap = true })
