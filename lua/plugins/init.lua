require("lazy").setup({
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

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
  },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("plugins.nvim-tree")
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    config = function()
      require("plugins.copilot")
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup {
        show_current_context = true,
        show_current_context_start = true,
      }
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = true,
  },

  {
    "numToStr/Comment.nvim",
    config = true
  },

  {
    "luukvbaal/statuscol.nvim",
    config = function()
      require("plugins.statuscol")
    end,
  },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async"
    },
    config = function()
      require("plugins.ufo")
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("plugins.gitsigns")
    end,
  },

  {
    "chentoast/marks.nvim",
    config = true,
  },

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("plugins.lualine")
    end,
  },

  {
    "sindrets/diffview.nvim",
    config = function()
      require("plugins.diffview")
    end,
  },

  {
    "folke/todo-comments.nvim",
    config = function()
      require("plugins.todo-comments")
    end,
  },

  {
    "lewis6991/satellite.nvim",
    config = function()
      require("plugins.satellite")
    end,
  },

  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("neoclip").setup()
      require("telescope").load_extension("neoclip")
    end
  },

  {
    'NvChad/nvim-colorizer.lua',
    config = true,
  },

  {
    'projekt0n/github-nvim-theme',
    lazy = false,
    priority = 1001,
    config = function()
      require("plugins.github-nvim-theme")
    end
  },

  {
    "j-hui/fidget.nvim", -- Lsp progress indicator
    config = true,
  },

  {
    "onsails/lspkind.nvim"
  },

  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim"
    },
    opts = {
      lsp = {
        auto_attach = true,
      }
    }
  },

  {
    "chrisgrieser/nvim-early-retirement",
    config = true,
    event = "VeryLazy",
  },

  {
    "chrisgrieser/nvim-spider",
    config = function()
      require("plugins.spider")
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("plugins.null-ls")
    end,
  },

  {
    "kevinhwang91/nvim-hlslens",
    config = true,
  },

  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("plugins.refactoring")
    end,
  },

  {
    "yioneko/nvim-vtsls",
  },

  {
    "nvim-neotest/neotest",
    config = function()
      require("plugins.neotest")
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "vim-test/vim-test",

      -- adapters
      "nvim-neotest/neotest-vim-test",
      "nvim-neotest/neotest-jest"
    }
  },

  {
    "numToStr/Navigator.nvim",
    config = true,
  },

  {
    "stevearc/dressing.nvim",
    config = true,
  },

  {
    'tzachar/highlight-undo.nvim',
    config = function()
      require('highlight-undo').setup({
        hlgroup = 'HighlightUndo',
        duration = 300,
        keymaps = {
          { 'n', 'u', 'undo', {} },
          { 'n', '<C-r>', 'redo', {} },
        }
      })
    end
  },

  {
    'dmmulroy/tsc.nvim',
    config = true,
  },

  {
    "karb94/neoscroll.nvim",
    config = true,
  }
})
