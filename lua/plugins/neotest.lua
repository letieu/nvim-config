require("neotest").setup({
  adapters = {
    require('neotest-jest')({
      jestCommand = "yarn test --",
      env = { CI = true },
      cwd = function(path)
        return vim.fn.getcwd()
      end,
    }),
    require("neotest-vim-test")({ ignore_filetypes = { "python", "lua" } }),
  }
})
