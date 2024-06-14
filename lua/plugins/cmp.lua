return {
  "hrsh7th/nvim-cmp",
  event = {
    "InsertEnter",
  },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    {
      "MattiasMTS/cmp-dbee",
      dependencies = {
        { "kndndrj/nvim-dbee" }
      },
      ft = "sql", -- optional but good to have
      config = function() require("cmp-dbee").setup({}) end
    },
  },
  config = function()
    local cmp = require "cmp"

    cmp.setup {
      mapping = cmp.mapping.preset.insert {
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
        ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
      },
      sources = cmp.config.sources {
        { name = "nvim_lsp" },
        { name = "cmp-dbee" },
      },
      matching = {
        disallow_fuzzy_matching = true,
        disallow_fullfuzzy_matching = true,
        disallow_partial_fuzzy_matching = true,
        disallow_partial_matching = true,
        disallow_prefix_unmatching = false,
      },
      experimental = {
        ghost_text = false,
      },
    }
  end,
}
