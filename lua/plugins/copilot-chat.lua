return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  dependencies = {
    { "zbirenbaum/copilot.lua" },
    { "nvim-lua/plenary.nvim" },
  },
  opts = {
    debug = false,
    show_help = false,
  },
  keys = {
    { "<leader>cc", "<cmd>lua require('CopilotChat').toggle()<CR>", desc = "Toggle copilot chat" },
  }
}
