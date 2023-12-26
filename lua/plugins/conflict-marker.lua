vim.g.conflict_marker_highlight_group = ''
vim.g.conflict_marker_begin = '^<<<<<<< .*$'
vim.g.conflict_marker_end = '^>>>>>>> .*$'

vim.api.nvim_set_hl(0, 'ConflictMarkerBegin', { fg = '#cf222e', bold = true })
vim.api.nvim_set_hl(0, 'ConflictMarkerEnd', { fg = '#cf222e', bold = true })

vim.api.nvim_set_hl(0, 'ConflictMarkerOurs', { bg = '#e6ffec' })
vim.api.nvim_set_hl(0, 'ConflictMarkerTheirs', { bg = '#ffebe9' })
vim.api.nvim_set_hl(0, 'ConflictMarkerCommonAncestorsHunk', { bg = '#754a81' })
