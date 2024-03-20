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
      show_folds = true, -- Shows folds for sections in chat
      show_help = false, -- Shows help message as virtual lines when waiting for user input
      clear_chat_on_new_prompt = false, -- Clears chat on every new prompt
      auto_follow_cursor = true, -- Auto-follow cursor in chat
      name = "", -- Name to use in chat
      separator = "-------------------------", -- Separator to use in chat
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
