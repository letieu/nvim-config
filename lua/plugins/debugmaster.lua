return {
  {
    "miroshQa/debugmaster.nvim",
    dependencies = { "mfussenegger/nvim-dap", },
    config = function()
      local dm = require("debugmaster")
      vim.keymap.set({ "n", "v" }, "<leader>db", dm.mode.toggle, { nowait = true })

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

      -- configs
      dap.configurations.typescript = {
        {
          type                      = "pwa-node",
          request                   = "attach",
          name                      = "Attach (sourceMaps = true)",
          cwd                       = "${workspaceFolder}",
          sourceMaps                = true,
          protocol                  = "inspector",
          resolveSourceMapLocations = {
            "${workspaceFolder}/**",
            "!**/node_modules/**",
          },

        }
      }
    end
  }
}
