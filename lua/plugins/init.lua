require("lazy").setup({
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
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    config = function()
      require("plugins.gruvbox")
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
    "ray-x/lsp_signature.nvim",
    config = true,
  },

  {
    "lewis6991/satellite.nvim",
    config = function()
      require("plugins.satellite")
    end,
  },

  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    ft = "norg",
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.norg.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/notes",
            },
            default_workspace = "notes",
          },
        },
      },
    },
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },

  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
      require("lspsaga").setup({})
    end,
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" }
    }
  },

  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
    config = function ()
      require("neoclip").setup()
      require("telescope").load_extension("neoclip")
    end
  }
})
