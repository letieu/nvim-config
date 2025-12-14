-- return {
--   "stevearc/oil.nvim",
--   opts = {
--     keymaps = {
--       ["<C-y>"] = "actions.yank_entry",
--     }
--   },
--   dependencies = { "nvim-tree/nvim-web-devicons" },
--   keys = {
--     {
--       "<leader>o",
--       function()
--         require("oil").open()
--       end,
--       desc = "Oil - Open",
--     },
--   },
-- }
return {
  "A7Lavinraj/fyler.nvim",
  dependencies = { "nvim-mini/mini.icons" },
  branch = "stable", -- Use stable branch for production
  lazy = false,      -- Necessary for `default_explorer` to work properly
  opts = {},
  config = function()
    require("fyler").setup({})
    vim.keymap.set("n", "<leader>o", "<cmd>Fyler<cr>", { desc = "Open Fyler View" })
  end
}
