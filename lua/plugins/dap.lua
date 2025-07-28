local function config_nodejs()
  local dap = require("dap")
  -- adapters
  dap.adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
      command = "/home/tieu/.local/share/nvim/mason/bin/js-debug-adapter",
      args = { "${port}" },
    }
  }

  dap.adapters.lldb = {
    type = 'executable',
    command = '/home/tieu/.local/share/nvim/mason/bin/codelldb',
    name = 'lldb'
  }

  -- config

  dap.configurations.zig = {
    {
      name        = 'Launch',
      type        = 'lldb',
      request     = 'launch',
      program     = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd         = '${workspaceFolder}',
      stopOnEntry = false,
      args        = function()
        local input = vim.fn.input('Arguments: ')
        return vim.fn.split(input, " ", true)
      end
    },
  }

  for _, language in ipairs({ "typescript", "javascript" }) do
    dap.configurations[language] = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        type                      = "pwa-node",
        request                   = "launch",
        name                      = "Launch NestJS Auth backend",
        program                   = "/home/tieu/code/ONE/om-com-auth-backend/dist/apps/om-com-auth-backend/main.js",
        cwd                       = "${workspaceFolder}",
        runtimeArgs               = { "--inspect" },
        sourceMaps                = true,
        protocol                  = "inspector",
        resolveSourceMapLocations = {
          "${workspaceFolder}/**",
          "!**/node_modules/**",
        },
      },
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
  map('n', '<F10>', function() require('dap').step_over() end, { desc = 'Step over' })
  map('n', '<F11>', function() require('dap').step_into() end, { desc = 'Step into' })
  map('n', '<F12>', function() require('dap').step_out() end, { desc = 'Step out' })

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
