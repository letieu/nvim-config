return {
  'saghen/blink.cmp',
  lazy = false,
  version = 'v0.*',
  opts = {
    sources = {
      completion = {
        enabled_providers = { "lsp", "path", "snippets", "buffer", "dadbod" },
      },
      providers = {
        dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
      },
    },
    keymap = {
      ['<Tab>'] = { 'select_and_accept', 'fallback' },
      ['<C-j>'] = { 'select_next' },
      ['<C-k>'] = { 'select_prev' },
    },
  }
}
