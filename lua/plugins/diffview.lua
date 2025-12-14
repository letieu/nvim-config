-- return {
--   "sindrets/diffview.nvim",
--   lazy = true,
--   keys = {
--     {
--       "<leader>do",
--       function()
--         require("diffview").open()
--       end,
--       desc = "Diffview - Open",
--     },
--     {
--       "<leader>dc",
--       function()
--         require("diffview").close()
--       end,
--       desc = "Diffview - Close",
--     },
--     {
--       "<leader>fh",
--       function()
--         require("diffview").file_history(nil, "%")
--       end,
--     }
--   },
--   cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
-- }

return {
  "esmuellert/vscode-diff.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  lazy = false,
  keys = {
    {
      "<leader>do",
      ":CodeDiff<CR>",
      desc = "Diffview - Open",
    },
    {
      "<leader>dc",
      ":tabclose<CR>",
      desc = "Diffview - Close",
    },
    -- {
      -- "<leader>fh",
      -- function()
      --   require("diffview").file_history(nil, "%")
      -- end,
    -- }
  },
}
