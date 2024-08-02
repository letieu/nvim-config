local setHighlight = function()
  local defaultH1 = vim.api.nvim_get_hl_by_name('markdownH1', true)
  local defaultH2 = vim.api.nvim_get_hl_by_name('markdownH2', true)
  local defaultH3 = vim.api.nvim_get_hl_by_name('markdownH3', true)
  local defaultH4 = vim.api.nvim_get_hl_by_name('markdownH4', true)
  local defaultH5 = vim.api.nvim_get_hl_by_name('markdownH5', true)
  local defaultH6 = vim.api.nvim_get_hl_by_name('markdownH6', true)
  local cursorLine = vim.api.nvim_get_hl_by_name('CursorLine', true)

  -- Headings
  vim.api.nvim_set_hl(0, 'Md_h1', { fg = defaultH1.foreground, bg = defaultH1.background, bold = true })
  vim.api.nvim_set_hl(0, 'Md_h2', { fg = defaultH2.foreground, bg = defaultH2.background, bold = true })
  vim.api.nvim_set_hl(0, 'Md_h3', { fg = defaultH3.foreground, bg = defaultH3.background, bold = true })
  vim.api.nvim_set_hl(0, 'Md_h4', { fg = defaultH4.foreground, bg = defaultH4.background, bold = true })
  vim.api.nvim_set_hl(0, 'Md_h5', { fg = defaultH5.foreground, bg = defaultH5.background, bold = true })
  vim.api.nvim_set_hl(0, 'Md_h6', { fg = defaultH5.foreground, bg = defaultH5.background, bold = true })

  -- Code
  vim.api.nvim_set_hl(0, 'Md_code', { bg = cursorLine.background })
end

return {
  'MeanderingProgrammer/markdown.nvim',
  dependencies = { 'nvim-treesitter' },
  config = function()
    setHighlight()

    require('render-markdown').setup({
      enabled = true,
      max_file_size = 1.5,
      log_level = 'error',
      file_types = { 'markdown' },
      render_modes = { 'n', 'c' },
      exclude = {
        buftypes = {},
      },
      anti_conceal = {
        enabled = true,
      },
      latex = {
        enabled = false,
      },
      heading = {
        -- Turn on / off heading icon & background rendering
        enabled = true,
        -- Turn on / off any sign column related rendering
        sign = false,
        -- Replaces '#+' of 'atx_h._marker'
        -- The number of '#' in the heading determines the 'level'
        -- The 'level' is used to index into the array using a cycle
        -- The result is left padded with spaces to hide any additional '#'
        icons = { '󰍟 ', '󰍟 ', '󰍟 ', '󰍟 ', '󰍟 ', '󰍟 ' },
        -- Added to the sign column if enabled
        -- The 'level' is used to index into the array using a cycle
        signs = { '󰫎 ' },
        -- The 'level' is used to index into the array using a clamp
        -- Highlight for the heading icon and extends through the entire line
        backgrounds = {
          'Md_h1',
          'Md_h2',
          'Md_h3',
          'Md_h4',
          'Md_h5',
          'Md_h6',
        },
        -- The 'level' is used to index into the array using a clamp
        -- Highlight for the heading and sign icons
        foregrounds = {
          'Md_h1',
          'Md_h2',
          'Md_h3',
          'Md_h4',
          'Md_h5',
          'Md_h6',
        },
      },
      code = {
        -- Turn on / off code block & inline code rendering
        enabled = true,
        -- Turn on / off any sign column related rendering
        sign = true,
        -- Determines how code blocks & inline code are rendered:
        --  none: disables all rendering
        --  normal: adds highlight group to code blocks & inline code, adds padding to code blocks
        --  language: adds language icon to sign column if enabled and icon + name above code blocks
        --  full: normal + language
        style = 'full',
        left_pad = 0,
        border = 'thin',
        above = '▄',
        -- Used below code blocks for thin border
        below = '▀',
        -- Highlight for code blocks & inline code
        highlight = 'Md_code',
      },
      dash = {
        -- Turn on / off thematic break rendering
        enabled = true,
        -- Replaces '---'|'***'|'___'|'* * *' of 'thematic_break'
        -- The icon gets repeated across the window's width
        icon = '─',
        -- Highlight for the whole line generated from the icon
        highlight = 'RenderMarkdownDash',
      },
      bullet = {
        -- Turn on / off list bullet rendering
        enabled = true,
        -- Replaces '-'|'+'|'*' of 'list_item'
        -- How deeply nested the list is determines the 'level'
        -- The 'level' is used to index into the array using a cycle
        -- If the item is a 'checkbox' a conceal is used to hide the bullet instead
        icons = { '', '', '󰫥', '󰫣' },
        -- Highlight for the bullet icon
        highlight = 'RenderMarkdownBullet',
      },
      -- Checkboxes are a special instance of a 'list_item' that start with a 'shortcut_link'
      -- There are two special states for unchecked & checked defined in the markdown grammar
      checkbox = {
        -- Turn on / off checkbox state rendering
        enabled = true,
        unchecked = {
          -- Replaces '[ ]' of 'task_list_marker_unchecked'
          icon = '󰄱 ',
          -- Highlight for the unchecked icon
          highlight = 'RenderMarkdownUnchecked',
        },
        checked = {
          -- Replaces '[x]' of 'task_list_marker_checked'
          icon = '󰱒 ',
          -- Highligh for the checked icon
          highlight = 'RenderMarkdownChecked',
        },
        -- Define custom checkbox states, more involved as they are not part of the markdown grammar
        -- As a result this requires neovim >= 0.10.0 since it relies on 'inline' extmarks
        -- Can specify as many additional states as you like following the 'todo' pattern below
        --   The key in this case 'todo' is for healthcheck and to allow users to change its values
        --   'raw': Matched against the raw text of a 'shortcut_link'
        --   'rendered': Replaces the 'raw' value when rendering
        --   'highlight': Highlight for the 'rendered' icon
        custom = {
          todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo' },
        },
      },
      quote = {
        -- Turn on / off block quote & callout rendering
        enabled = true,
        -- Replaces '>' of 'block_quote'
        icon = '▋',
        -- Highlight for the quote icon
        highlight = 'RenderMarkdownQuote',
      },
      pipe_table = {
        -- Turn on / off pipe table rendering
        enabled = true,
        -- Determines how the table as a whole is rendered:
        --  none: disables all rendering
        --  normal: applies the 'cell' style rendering to each row of the table
        --  full: normal + a top & bottom line that fill out the table when lengths match
        style = 'full',
        -- Determines how individual cells of a table are rendered:
        --  overlay: writes completely over the table, removing conceal behavior and highlights
        --  raw: replaces only the '|' characters in each row, leaving the cells unmodified
        --  padded: raw + cells are padded with inline extmarks to make up for any concealed text
        cell = 'padded',
        -- Characters used to replace table border
        -- Correspond to top(3), delimiter(3), bottom(3), vertical, & horizontal
        -- stylua: ignore
        border = {
          '┌', '┬', '┐',
          '├', '┼', '┤',
          '└', '┴', '┘',
          '│', '─',
        },
        -- Highlight for table heading, delimiter, and the line above
        head = 'RenderMarkdownTableHead',
        -- Highlight for everything else, main table rows and the line below
        row = 'RenderMarkdownTableRow',
        -- Highlight for inline padding used to add back concealed space
        filler = 'RenderMarkdownTableFill',
      },
      -- Callouts are a special instance of a 'block_quote' that start with a 'shortcut_link'
      -- Can specify as many additional values as you like following the pattern from any below, such as 'note'
      --   The key in this case 'note' is for healthcheck and to allow users to change its values
      --   'raw': Matched against the raw text of a 'shortcut_link', case insensitive
      --   'rendered': Replaces the 'raw' value when rendering
      --   'highlight': Highlight for the 'rendered' text and quote markers
      callout = {
        note = { raw = '[!NOTE]', rendered = '󰋽 Note', highlight = 'RenderMarkdownInfo' },
        tip = { raw = '[!TIP]', rendered = '󰌶 Tip', highlight = 'RenderMarkdownSuccess' },
        important = { raw = '[!IMPORTANT]', rendered = '󰅾 Important', highlight = 'RenderMarkdownHint' },
        warning = { raw = '[!WARNING]', rendered = '󰀪 Warning', highlight = 'RenderMarkdownWarn' },
        caution = { raw = '[!CAUTION]', rendered = '󰳦 Caution', highlight = 'RenderMarkdownError' },
        -- Obsidian: https://help.a.md/Editing+and+formatting/Callouts
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
        -- Turn on / off inline link icon rendering
        enabled = true,
        -- Inlined with 'image' elements
        image = '󰥶 ',
        -- Inlined with 'inline_link' elements
        hyperlink = '󰌹 ',
        -- Applies to the inlined icon
        highlight = 'RenderMarkdownLink',
      },
      sign = {
        -- Turn on / off sign rendering
        enabled = false,
        -- More granular mechanism, disable signs within specific buftypes
        exclude = {
          buftypes = { 'nofile' },
        },
        -- Applies to background of sign text
        highlight = 'RenderMarkdownSign',
      },
      -- Window options to use that change between rendered and raw view
      win_options = {
        -- See :h 'conceallevel'
        conceallevel = {
          -- Used when not being rendered, get user setting
          default = vim.api.nvim_get_option_value('conceallevel', {}),
          -- Used when being rendered, concealed text is completely hidden
          rendered = 3,
        },
        -- See :h 'concealcursor'
        concealcursor = {
          -- Used when not being rendered, get user setting
          default = vim.api.nvim_get_option_value('concealcursor', {}),
          -- Used when being rendered, disable concealing text in all modes
          rendered = '',
        },
      },
      -- Mapping from treesitter language to user defined handlers
      -- See 'Custom Handlers' document for more info
      custom_handlers = {},
    })
  end,
}
