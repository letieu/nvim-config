local function config_nodejs()
  require("dap").adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
      command = "/home/tieu/.local/share/nvim/mason/bin/js-debug-adapter",
      args = { "${port}" },
    }
  }

  local dap = require("dap")
  for _, language in ipairs({ "typescript", "javascript" }) do
    dap.configurations[language] = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch NestJS",
        program = "${workspaceFolder}/dist/main.js", -- Compiled NestJS entry point
        cwd = "${workspaceFolder}",
        runtimeArgs = { "--inspect" },
        sourceMaps = true,
        protocol = "inspector",
        resolveSourceMapLocations = {
          "${workspaceFolder}/**",
          "!**/node_modules/**",
        },
      },
    }
  end
end

local function setup_keymap()
  local map = vim.keymap.set

  map('n', '<leader>dd', function() require('dap').continue() end, { desc = 'Start/Continue debugging' })
  map('n', '<leader>dj', function() require('dap').step_over() end, { desc = 'Step over' })
  map('n', '<leader>dl', function() require('dap').step_into() end, { desc = 'Step into' })
  map('n', '<leader>dh', function() require('dap').step_out() end, { desc = 'Step out' })

  map('n', '<leader>db', function() require('dap').toggle_breakpoint() end, { desc = 'Toggle breakpoint' })
  map('n', '<leader>dc', function() require('dap').clear_breakpoints() end, { desc = 'Clear all breakpoints' })
  map('n', '<leader>dr', function() require('dap').repl.open() end, { desc = 'Open REPL' })

  map('n', '<leader>de', function()
    require('dap.ui.widgets').hover()
  end, { desc = 'Evaluate variable under cursor' })

  map('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
  end)
  map('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
  end)
end

return {
  "mfussenegger/nvim-dap",
  config = function()
    config_nodejs()
    setup_keymap()
  end
}
