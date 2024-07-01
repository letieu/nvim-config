return {
  "zbirenbaum/copilot.lua",
  event = { "InsertEnter" },
  cmd = { "Copilot" },
  config = function()
    require('copilot').setup({
      panel = {
        enabled = false,
      },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<M-l>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      copilot_node_command = 'node', -- Node.js version must be > 18.x
      server_opts_overrides = {},
    })
  end
}
