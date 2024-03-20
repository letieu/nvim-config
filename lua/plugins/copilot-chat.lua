return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      local select = require "CopilotChat.select"

      require("CopilotChat").setup {
        context = "manual", -- Context to use, 'buffers', 'buffer' or 'manual'
        debug = false,
        show_folds = true, -- Shows folds for sections in chat
        show_help = false, -- Shows help message as virtual lines when waiting for user input
        clear_chat_on_new_prompt = false, -- Clears chat on every new prompt
        auto_follow_cursor = true, -- Auto-follow cursor in chat
        name = "", -- Name to use in chat
        separator = "-------------------------", -- Separator to use in chat
        history_path = vim.fn.stdpath "data" .. "/copilotchat_history", -- Default path to stored history
        callback = nil,
        -- default prompts
        prompts = {
          Explain = {
            prompt = "/COPILOT_EXPLAIN Write an explanation for the code above as paragraphs of text. Keep the explanation short, concise and to the point.",
          },
          Tests = {
            prompt = "/COPILOT_TESTS Write a set of detailed unit test functions for the code above.",
          },
          Fix = {
            prompt = "/COPILOT_FIX There is a problem in this code. Rewrite the code to show it with the bug fixed.",
          },
          Optimize = {
            prompt = "/COPILOT_REFACTOR Optimize the selected code to improve performance and readablilty.",
          },
          Docs = {
            prompt = "/COPILOT_REFACTOR Write documentation for the selected code. The reply should be a codeblock containing the original code with the documentation added as comments. Use the most appropriate documentation style for the programming language used (e.g. JSDoc for JavaScript, docstrings for Python etc.",
          },
          FixDiagnostic = {
            prompt = "Please assist with the following diagnostic issue in file:",
            selection = select.diagnostics,
          },
          Commit = {
            prompt = "Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
            selection = select.gitdiff,
          },
          CommitStaged = {
            prompt = "Write commit message for the change with commitizen convention. Make sure the title has maximum 50 characters and message is wrapped at 72 characters. Wrap the whole message in code block with language gitcommit.",
            selection = function(source)
              return select.gitdiff(source, true)
            end,
          },
        },

        -- default selection (visual or line)
        selection = function(source)
          return select.visual(source) or select.line(source)
        end,

        -- default window options
        window = {
          layout = "vertical", -- 'vertical', 'horizontal', 'float'
        },
        -- default mappings
        mappings = {
          close = "q",
          reset = "<C-l>",
          complete = "<Tab>",
          submit_prompt = "<CR>",
          accept_diff = "<C-y>",
          show_diff = "gd",
          show_system_prompt = "gp",
          show_user_selection = "gs",
        },
      }
    end,

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
        "<leader>co",
        function()
          require("CopilotChat").open()
        end,
        desc = "CopilotChat - Open",
      },
    },
  },
}
