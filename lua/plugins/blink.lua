return {
  'saghen/blink.cmp',
  lazy = false,
  version = 'v0.*',
  opts = {
    sources = {
      providers = {
        dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
      },
      default = { 'lsp', 'path', 'snippets', 'buffer', 'dadbod' },
    },
    keymap = {
      ['<Tab>'] = { 'select_and_accept', 'fallback' },
      ['<C-j>'] = { 'select_next' },
      ['<C-k>'] = { 'select_prev' },
    },
    signature = { enabled = true }
  }
}
