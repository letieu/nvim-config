if not string.find(vim.env.PATH or '', '/.cargo/bin') then
  vim.env.PATH = vim.fn.expand('~/.cargo/bin') .. ':' .. (vim.env.PATH or '')
end
if not string.find(vim.env.PATH or '', '/go/bin') then
  vim.env.PATH = vim.fn.expand('~/go/bin') .. ':' .. (vim.env.PATH or '')
end


vim.g.mapleader = " "
vim.opt.shortmess:append("c") -- Prevents showing extra messages when using completion
vim.opt.cmdheight = 1
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.timeoutlen = 500
vim.opt.swapfile = false
vim.opt.updatetime = 4000 -- Time in milliseconds of inactivity before calling CursorHold or writing to swap
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.splitright = true -- Put new vertical splits to the right
vim.opt.splitbelow = true -- Put new horizontal splits below

local my_group_id = vim.api.nvim_create_augroup('my.config', {
  clear = false
})

vim.api.nvim_create_autocmd("TextYankPost", {
  group = my_group_id,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 150 }
  end,
})

-- Ensures the menu appears even for a single match and uses the native popup window.
vim.opt.completeopt = "menu,menuone,noselect,popup"

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp_attach_config", { clear = true }),
  callback = function(args)
    local client_id = args.data.client_id
    if not client_id then
      return
    end

    local client = vim.lsp.get_client_by_id(client_id)
    if not client then
      return
    end

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf, desc = 'LSP: Go to definition' })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = args.buf, desc = 'LSP: Go to declaration' })
    vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format({ async = true }) end, { buffer = args.buf, desc = 'LSP: Format buffer' })

    if client:supports_method("textDocument/completion") then
      -- Enable native LSP completion for this client + buffer
      vim.lsp.completion.enable(true, client_id, args.buf, {
        autotrigger = true,
      })

      vim.bo.autocomplete = true
    end
  end,
})

vim.lsp.enable({ 'gopls', 'vtsls', 'eslint', 'lua_ls', 'templ', 'zls', 'dartls', 'vue_ls', 'html', 'rust_analyzer',
  'clangd' })
vim.keymap.set('n', '<leader>f', vim.diagnostic.open_float)

require('vim._core.ui2').enable({})

-- oil
vim.pack.add({
  'https://github.com/stevearc/oil.nvim'
})
require("oil").setup()
vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open oil, open parent" })

-- fff
vim.pack.add({ 'https://github.com/dmtrKovalenko/fff.nvim' })
-- the plugin will automatically lazy load
vim.g.fff = {
  lazy_sync = true, -- start syncing only when the picker is open
  debug = {
    enabled = true,
    show_scores = true,
  },
}
vim.keymap.set(
  'n',
  '<leader>ff',
  function() require('fff').find_files() end,
  { desc = 'FFFind files' }
)
vim.keymap.set(
  'n',
  '<leader>fw',
  function() require('fff').live_grep() end,
  { desc = 'Live grep' }
)

-- theme
vim.pack.add({
  "https://github.com/rose-pine/neovim"
})
vim.cmd("colorscheme rose-pine")

-- undo tree
vim.cmd("packadd nvim.undotree")

-- gitsign
vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })
require('gitsigns').setup {
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({ ']c', bang = true })
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({ '[c', bang = true })
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
    map('n', '<leader>hr', gitsigns.reset_hunk)
    map('n', '<leader>hv', gitsigns.preview_hunk_inline)
    map('n', '<leader>hb', function()
      gitsigns.blame_line({ full = true })
    end)

    map('n', '<leader>hq', gitsigns.setqflist)
    map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
  end
}

vim.pack.add({ "https://github.com/mrjones2014/smart-splits.nvim" })
require('smart-splits').setup({})


vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)

-- moving between splits
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)

vim.pack.add({"https://github.com/nvim-treesitter/nvim-treesitter"})

require('nvim-treesitter').setup {
  install_dir = vim.fn.stdpath('data') .. '/site'
}

-- dadbod
vim.g.db_ui_use_nerd_fonts = 1

vim.pack.add({
  'https://github.com/tpope/vim-dadbod',
  'https://github.com/kristijanhusak/vim-dadbod-ui',
  'https://github.com/kristijanhusak/vim-dadbod-completion',
})

vim.keymap.set('n', '<leader>db', '<CMD>DBUIToggle<CR>', { desc = 'Toggle DBUI' })

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('dadbod_ui', { clear = true }),
  pattern = { 'sql', 'mysql', 'plsql' },
  callback = function()
    vim.bo.omnifunc = 'vim_dadbod_completion#omni'
    vim.keymap.set('n', '<leader>r', 'vip<Plug>(DBUI_ExecuteQuery)', { remap = true, buffer = true, desc = 'Execute query under cursor' })
    vim.keymap.set('v', '<leader>r', '<Plug>(DBUI_ExecuteQuery)', { remap = true, buffer = true, desc = 'Execute selected query' })
  end,
})

-- rest.nvim
package.path = package.path
  .. ';' .. vim.fn.stdpath('data') .. '/site/pack/core/opt/xml2lua/?.lua'
  .. ';' .. vim.fn.stdpath('data') .. '/site/pack/core/opt/mimetypes/?.lua'

vim.pack.add({
  'https://github.com/nvim-neotest/nvim-nio',
  'https://github.com/j-hui/fidget.nvim',
  'https://github.com/manoelcampos/xml2lua',
  { src = 'https://github.com/lunarmodules/lua-mimetypes', name = 'mimetypes' },
  'https://github.com/rest-nvim/rest.nvim',
})

vim.api.nvim_create_autocmd('FileType', {
  group = vim.api.nvim_create_augroup('rest_nvim_config', { clear = true }),
  pattern = { 'http' },
  callback = function(args)
    vim.keymap.set('n', '<leader>rr', '<CMD>Rest run<CR>', { buffer = args.buf, desc = 'REST: Run request under cursor' })
    vim.keymap.set('n', '<leader>rl', '<CMD>Rest run last<CR>', { buffer = args.buf, desc = 'REST: Re-run last request' })
    vim.keymap.set('n', '<leader>ro', '<CMD>vertical Rest open<CR>', { buffer = args.buf, desc = 'REST: Open result pane' })
  end,
})
