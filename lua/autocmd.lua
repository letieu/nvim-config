-- blink yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankHighlight", {}),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 150 }
  end,
})

-- attach lsp keymaps
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(args)
    local on_lsp_attach = require("lsp.utils").on_attach
    on_lsp_attach(args.data.client_id, args.buf)
  end,
})

-- notify when recording
local macro_group = vim.api.nvim_create_augroup("Macro", { clear = true })
vim.api.nvim_create_autocmd("RecordingEnter", {
  group = macro_group,
  pattern = "*",
  callback = function()
    require("fidget").notify "Recording"
  end,
})
--
vim.api.nvim_create_autocmd("RecordingLeave", {
  group = macro_group,
  pattern = "*",
  callback = function()
    require("fidget").notify "Stopped recording"
  end,
})
