return {
  'saghen/blink.cmp',
  lazy = false,
  version = 'v0.*',
  dependencies = 'rafamadriz/friendly-snippets',
  opts = {
    keymap = {
      accept = '<Tab>',
      select_prev = { '<Up>', '<C-k>' },
      select_next = { '<Down>', '<C-j>' },
    },
  }
}
