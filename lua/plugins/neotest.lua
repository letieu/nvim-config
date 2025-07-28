return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",

    -- adapters
    'nvim-neotest/neotest-jest',
  },
  config = function()
    require('neotest').setup({
      adapters = {
        require('neotest-jest')({
          jestCommand = "npm test --",
          jestConfigFile = "custom.jest.config.ts",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        }),
      }
    })
  end,
  keys = {
    { "<leader>tn", function() require('neotest').run.run() end,                     desc = "Run nearest test" },
    { "<leader>tf", function() require('neotest').run.run(vim.fn.expand("%")) end,   desc = "Run all tests in file" },
    { "<leader>ts", function() require('neotest').summary.toggle() end,              desc = "Toggle test summary" },
    { "<leader>to", function() require('neotest').output.open({ enter = true }) end, desc = "View test output" },
  }
}
