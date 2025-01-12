return {
  'saghen/blink.cmp',
  version = 'v0.*',
  event = { "InsertEnter", "CmdlineEnter" },
  opts = {
    sources = {
      providers = {
        dadbod = {
          name = "Dadbod",
          module = "vim_dadbod_completion.blink",
          score_offset = 100,
        },
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
      default = { 'dadbod', 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
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
