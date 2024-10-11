return {
  'saghen/blink.cmp',
  lazy = false,
  version = 'v0.*',
  opts = {
    highlight = {
      use_nvim_cmp_as_default = true,
    },
    nerd_font_variant = 'normal',

    keymap = {
      accept = '<Tab>',

      show_documentation = {},
      hide_documentation = {},
      scroll_documentation_up = '<C-b>',
      scroll_documentation_down = '<C-f>',

      snippet_forward = '<Tab>',
      snippet_backward = '<S-Tab>',
    },

    -- experimental auto-brackets support
    accept = { auto_brackets = { enabled = true } },

    -- experimental signature help support
    trigger = { signature_help = { enabled = true } }
  }
}
