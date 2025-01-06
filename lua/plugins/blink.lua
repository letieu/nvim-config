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
      ['<Tab>'] = { 'select_and_accept', 'snippet_forward', 'fallback' },
      ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
      ['<C-j>'] = { 'select_next' },
      ['<C-k>'] = { 'select_prev' },
    },
    signature = { enabled = true },
    completion = {
      menu = {
        draw = {
          columns = { { "kind_icon" }, { "label", gap = 1 } },
          components = {
            label = {
              text = require("colorful-menu").blink_components_text,
              highlight = require("colorful-menu").blink_components_highlight,
            },
          },
        },
      },
    },
  }
}
