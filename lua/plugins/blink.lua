return {
  'saghen/blink.cmp',
  lazy = false,
  version = 'v0.*',
  opts = {
    keymap = {
      ['<Tab>'] = { 'select_and_accept' },
      ['<C-j>'] = { 'select_next' },
      ['<C-k>'] = { 'select_prev' },
    },
  }
}
