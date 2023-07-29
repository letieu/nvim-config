require("todo-comments").setup {}

-- Mapping
vim.keymap.set('n', '<leader>ft', ":TodoTelescope keywords=TODO,FIX,FIXME,HACK <CR>", {})
