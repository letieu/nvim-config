return {
  -- 'isakbm/gitgraph.nvim',
  dir = "/home/tieu/code/github/letieu/gitgraph.nvim",
  dependencies = { 'sindrets/diffview.nvim' },
  config = function()
    vim.wo.spell = false
    require('gitgraph').setup({
      symbols = {
        merge_commit = '',
        commit = '',
      },
      format = {
        timestamp = '%H:%M %d-%m-%y',
        fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' },
      },
      hooks = {
        on_select_commit = function(commit)
          vim.notify('DiffviewOpen ' .. commit.hash .. '^!')
          vim.cmd(':DiffviewOpen ' .. commit.hash .. '^!')
        end,
        on_select_range_commit = function(from, to)
          vim.notify('DiffviewOpen ' .. from.hash .. '~1..' .. to.hash)
          vim.cmd(':DiffviewOpen ' .. from.hash .. '~1..' .. to.hash)
        end,
      },
    })
  end,
  keys = {
    {
      "<leader>gl",
      function()
        require('gitgraph').draw({}, { all = true, max_count = 5000 })
      end,
      desc = "GitGraph - Draw",
    },
  },
}
