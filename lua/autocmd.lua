-- blink yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("YankHighlight", {}),
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 150 }
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
