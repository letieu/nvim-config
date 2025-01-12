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
          accept = "<C-,>",
          accept_word = false,
          accept_line = false,
        },
      },
      copilot_node_command = 'node',
      server_opts_overrides = {},
    })
  end
}
