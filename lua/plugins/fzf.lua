return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    desc     = "fzf-lua defaults with `sk` as binary",
    fzf_bin  = "sk",
    fzf_opts = {
      ["--no-separator"] = false,
      ['--history'] = vim.fn.stdpath("data") .. '/fzf-lua-history',
    },
    winopts  = {
      preview = {
        -- hidden = 'hidden', -- hidden|nohidden
      },
    },
    lsp      = {
      code_actions = {
        previewer = false,
        winopts = { height = 0.5, width = 0.5 },
      },
    },
  },
  config = function(_, opts)
    require("fzf-lua").setup(opts)
    require("fzf-lua").register_ui_select()
  end,
  event = { "LspAttach" },
  keys = {
    {
      "<leader>ff",
      function()
        require("fzf-lua").files()
      end,
      desc = "Find files",
    },
    {
      "<leader>fw",
      function()
        require("fzf-lua").live_grep()
      end,
      desc = "Fzf live grep",
    },
    {
      "<leader>fd",
      function()
        require("fzf-lua").diagnostics_document()
      end,
      desc = "Fzf diagnostics",
    },
    {
      "<leader>fD",
      function()
        require("fzf-lua").diagnostics_workspace()
      end,
      desc = "Fzf workspace diagnostics",
    },
    {
      "<leader>gs",
      function()
        require("fzf-lua").git_status()
      end,
      desc = "Fzf git status",
    },
    {
      "<leader>fs",
      function()
        require("fzf-lua").lsp_document_symbols()
      end,
    },
    {
      "<leader>fH",
      function()
        require("fzf-lua").help_tags()
      end,
      desc = "Fzf help tags",
    },
  },
}
