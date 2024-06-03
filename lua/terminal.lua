local te_buf = nil
local te_win_id = nil

local v = vim
local fun = v.fn
local cmd = v.api.nvim_command
local gotoid = fun.win_gotoid
local getid = fun.win_getid

local function openTerminal()
  if fun.bufexists(te_buf) ~= 1 then
    cmd("au TermOpen * setlocal nonumber norelativenumber signcolumn=no")
    cmd("sp | winc J | res 10 | te")
    te_win_id = getid()
    te_buf = fun.bufnr('%')
  elseif gotoid(te_win_id) ~= 1 then
    cmd("sb " .. te_buf .. "| winc J | res 10")
    te_win_id = getid()
  end
  cmd("startinsert")
  vim.api.nvim_win_set_height(0, 18)
end

local function hideTerminal()
  if gotoid(te_win_id) == 1 then
    cmd("hide")
  end
end

local function ToggleTerminal()
  if gotoid(te_win_id) == 1 then
    hideTerminal()
  else
    openTerminal()
  end
end


vim.keymap.set("n", "<C-;>", ToggleTerminal)
vim.keymap.set("t", "<C-;>", ToggleTerminal)
-- Easily hit escape in terminal mode.
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
