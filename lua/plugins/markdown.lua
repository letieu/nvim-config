return {
  'MeanderingProgrammer/markdown.nvim',
  dependencies = { 'nvim-treesitter' },
  config = function()
    require('render-markdown').setup({
      enabled = true,
      max_file_size = 1.5,
      log_level = 'error',
      file_types = { 'markdown' },
      render_modes = { 'n', 'c' },
      anti_conceal = {
        enabled = true,
      },
      latex = {
        enabled = false,
      },
      heading = {
        enabled = true,
        sign = false,
        icons = { '󰍟 ', '󰍟 ', '󰍟 ', '󰍟 ', '󰍟 ', '󰍟 ' },
        signs = { '󰫎 ' },
      },
      code = {
        enabled = true,
        sign = true,
        style = 'full',
        left_pad = 0,
        border = 'thin',
        above = '▄',
        below = '▀',
        highlight = 'Md_code',
      },
      dash = {
        enabled = true,
        icon = '─',
        highlight = 'RenderMarkdownDash',
      },
      bullet = {
        enabled = true,
        icons = { '', '', '󰫥', '󰫣' },
        highlight = 'RenderMarkdownBullet',
      },
      checkbox = {
        enabled = true,
        unchecked = {
          icon = '󰄱 ',
          highlight = 'RenderMarkdownUnchecked',
        },
        checked = {
          icon = '󰱒 ',
          highlight = 'RenderMarkdownChecked',
        },
        custom = {
          todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo' },
        },
      },
      quote = {
        enabled = true,
        icon = '▋',
        highlight = 'RenderMarkdownQuote',
      },
      pipe_table = {
        enabled = true,
        style = 'full',
        cell = 'padded',
        border = {
          '┌', '┬', '┐',
          '├', '┼', '┤',
          '└', '┴', '┘',
          '│', '─',
        },
        head = 'RenderMarkdownTableHead',
        row = 'RenderMarkdownTableRow',
        filler = 'RenderMarkdownTableFill',
      },
      callout = {
        note = { raw = '[!NOTE]', rendered = '󰋽 Note', highlight = 'RenderMarkdownInfo' },
        tip = { raw = '[!TIP]', rendered = '󰌶 Tip', highlight = 'RenderMarkdownSuccess' },
        important = { raw = '[!IMPORTANT]', rendered = '󰅾 Important', highlight = 'RenderMarkdownHint' },
        warning = { raw = '[!WARNING]', rendered = '󰀪 Warning', highlight = 'RenderMarkdownWarn' },
        caution = { raw = '[!CAUTION]', rendered = '󰳦 Caution', highlight = 'RenderMarkdownError' },
        abstract = { raw = '[!ABSTRACT]', rendered = '󰨸 Abstract', highlight = 'RenderMarkdownInfo' },
        todo = { raw = '[!TODO]', rendered = '󰗡 Todo', highlight = 'RenderMarkdownInfo' },
        success = { raw = '[!SUCCESS]', rendered = '󰄬 Success', highlight = 'RenderMarkdownSuccess' },
        question = { raw = '[!QUESTION]', rendered = '󰘥 Question', highlight = 'RenderMarkdownWarn' },
        failure = { raw = '[!FAILURE]', rendered = '󰅖 Failure', highlight = 'RenderMarkdownError' },
        danger = { raw = '[!DANGER]', rendered = '󱐌 Danger', highlight = 'RenderMarkdownError' },
        bug = { raw = '[!BUG]', rendered = '󰨰 Bug', highlight = 'RenderMarkdownError' },
        example = { raw = '[!EXAMPLE]', rendered = '󰉹 Example', highlight = 'RenderMarkdownHint' },
        quote = { raw = '[!QUOTE]', rendered = '󱆨 Quote', highlight = 'RenderMarkdownQuote' },
      },
      link = {
        enabled = true,
        image = '󰥶 ',
        hyperlink = '󰌹 ',
        highlight = 'RenderMarkdownLink',
      },
      sign = {
        enabled = false,
        highlight = 'RenderMarkdownSign',
      },
      win_options = {
        conceallevel = {
          default = vim.api.nvim_get_option_value('conceallevel', {}),
          rendered = 3,
        },
        concealcursor = {
          default = vim.api.nvim_get_option_value('concealcursor', {}),
          rendered = '',
        },
      },
      custom_handlers = {},
    })
  end,
}
