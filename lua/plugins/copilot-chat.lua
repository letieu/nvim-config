return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      debug = false,
      show_help = false, -- Shows help message as virtual lines when waiting for user input
      question_header = "**** ", -- Header to use for user questions
      answer_header = "**** ", -- Header to use for AI answers
      error_header = "**Error** ", -- Header to use for errors
      separator = "---", -- Separator to use in chat
      callback = nil,
    },
    keys = {
      {
        "<leader>cp",
        function()
          local actions = require "CopilotChat.actions"
          require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
        end,
        desc = "CopilotChat - Prompt actions",
      },
      {
        "<leader>ch",
        function()
          local actions = require "CopilotChat.actions"
          require("CopilotChat.integrations.telescope").pick(actions.help_actions())
        end,
        desc = "CopilotChat - Diagnostic actions",
      },
      {
        "<leader>co",
        function()
          require("CopilotChat").open()
        end,
        desc = "CopilotChat - Open",
      },
      {
        "<leader>cm",
        function()
          vim.cmd "CopilotChatCommitStaged"
        end,
        desc = "CopilotChat - Commit",
      },
    },

    cmd = {
      "CopilotChatOpen",
      "CopilotChatCommit",
      "CopilotChatCommitStaged",
    },
  },
}
