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
  group = vim.api.nvim_create_augroup("lsp_completion", { clear = true }),
  callback = function(args)
    local client_id = args.data.client_id
    if not client_id then
      return
    end

    local client = vim.lsp.get_client_by_id(client_id)
    if client and client:supports_method("textDocument/completion") then
      -- Enable native LSP completion for this client + buffer
      vim.lsp.completion.enable(true, client_id, args.buf, {
        autotrigger = true,
      })

      vim.bo.autocomplete = true
      vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format({ async = true }) end)
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
