local map = vim.keymap.set
require("gitsigns").setup {}

-- Mapping
map('n', '<leader>gh', ':Gitsigns preview_hunk<CR>', { noremap = true, silent = true })
map('n', '<leader>gr', ':Gitsigns reset_hunk<CR>', { noremap = true, silent = true })
map('n', '<leader>gb', ':Gitsigns blame_line<CR>', { noremap = true, silent = true })
