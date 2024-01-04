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
  },

  {
    "hrsh7th/nvim-cmp",
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
    config = true,
  },

  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
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

  { "lukas-reineke/indent-blankline.nvim", main = "ibl",  opts = {} },

  {
    "windwp/nvim-autopairs",
    config = true,
  },

  {
    "numToStr/Comment.nvim",
    config = true
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
    config = true,
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
    config = true,
  },

  {
    "lewis6991/satellite.nvim",
    config = function()
      require("plugins.satellite")
    end,
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
    "j-hui/fidget.nvim",
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
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-tree.lua",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },

  {
    "stevearc/dressing.nvim",
    opts = {}
  },

  {
    'tzachar/highlight-undo.nvim',
    config = function()
      require('highlight-undo').setup({
        hlgroup = 'HighlightUndo',
        duration = 300,
        keymaps = {
          { 'n', 'u',     'undo', {} },
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
  },

  {
    "wintermute-cell/gitignore.nvim",
  },

  {
    'mrjones2014/smart-splits.nvim',
    config = function()
      require("smart-splits")
    end
  },

  {
    "yioneko/nvim-vtsls"
  },

  {
    "zbirenbaum/copilot.lua",
    config = function()
      require("plugins.copilot")
    end,
  },

  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require("plugins.flutter-tools")
    end
  },

  {
    'chrisgrieser/nvim-recorder',
    opts = {},
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  { 'akinsho/git-conflict.nvim',           version = "*", config = true },

  {
    "Eandrju/cellular-automaton.nvim"
  }
})
