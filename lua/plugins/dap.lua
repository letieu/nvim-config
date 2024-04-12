return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require "dap"

    -- Adapter configuration
    dap.adapters.delve = {
      type = "server",
      port = "${port}",
      executable = {
        command = "dlv",
        args = { "dap", "-l", "127.0.0.1:${port}" },
      },
    }

    -- Debugger configuration
    dap.configurations.go = {
      {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = "${file}",
      },
      {
        type = "delve",
        name = "Debug test", -- configuration for debugging test files
        request = "launch",
        mode = "test",
        program = "${file}",
      },
      -- works with go.mod packages and sub packages
      {
        type = "delve",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}",
      },
    }
  end,
  keys = {
    { "<leader>bt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Debug toggle break point" },
    { "<leader>bl", "<cmd>lua require'dap'.list_breakpoints()<cr>", desc = "Debug list break points" },
    { "<leader>bc", "<cmd>lua require'dap'.clear_breakpoints()<cr>", desc = "Debug clear all break points" },
    --
    { "<F5>", "<cmd>lua require'dap'.continue()<cr>", desc = "Debug continue" },
    { "<F7>", "<cmd>lua require'dap'.step_into()<cr>", desc = "Debug step into" },
    { "<F8>", "<cmd>lua require'dap'.step_over()<cr>", desc = "Debug step over" },
    { "<F9>", "<cmd>lua require'dap'.step_out()<cr>", desc = "Debug step out" },

    --
    {
      "<leader>bs",
      function()
        local widgets = require "dap.ui.widgets"
        local my_sidebar = widgets.sidebar(widgets.scopes)
        my_sidebar.open()
      end,
      desc = "Debug show scopes",
    },
  },
}
