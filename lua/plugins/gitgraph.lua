---@diagnostic disable: missing-fields
return {
  'isakbm/gitgraph.nvim',
  dependencies = { 'sindrets/diffview.nvim' },
  config = function()
    vim.wo.spell = false
    require('gitgraph').setup({
      symbols = {
        merge_commit = '',
        commit = '',
        merge_commit_end = '',
        commit_end = '',

        -- Advanced symbols
        GVER = '',
        GHOR = '',
        GCLD = '',
        GCRD = '╭',
        GCLU = '',
        GCRU = '',
        GLRU = '',
        GLRD = '',
        GLUD = '',
        GRUD = '',
        GFORKU = '',
        GFORKD = '',

        GRUDCD = '',
        GRUDCU = '',
        GLUDCD = '',
        GLUDCU = '',
        GLRDCL = '',
        GLRDCR = '',
        GLRUCL = '',
        GLRUCR = '',
      },
      format = {
        timestamp = '%H:%M %d-%m-%y',
        fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' },
      },
      hooks = {
        on_select_commit = function(commit)
          vim.cmd(':CodeDiff ' .. commit.hash .. '~1 ' .. commit.hash)
        end,
        on_select_range_commit = function(from, to)
          vim.notify('CodeDiff ' .. from.hash .. ' ' .. to.hash)
          vim.cmd(':CodeDiff ' .. from.hash .. ' ' .. to.hash)
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
