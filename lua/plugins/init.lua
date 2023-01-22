require("lazy").setup({
  "folke/neodev.nvim",
  "L3MON4D3/LuaSnip",
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.lsp")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip"
    },
    config = function()
      require("plugins.cmp")
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("plugins.mason")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("plugins.treesitter")
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("plugins.telescope")
    end,
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("plugins.harpoon")
    end,
  }
})
