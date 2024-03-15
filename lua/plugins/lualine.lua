local function recorder_status()
  return require("recorder").recordingStatus()
end

local function recorder_slots()
  return require("recorder").displaySlots()
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "chrisgrieser/nvim-recorder" },
  opts = {
    options = {
      icons_enabled = true,
      component_separators = { left = ' ', right = ' ' },
      section_separators = { left = ' ', right = ' ' },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = {},
      always_divide_middle = true,
      globalstatus = true,
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      }
    },
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', 'diff', 'diagnostics' },
      lualine_c = { '%=', "harpoon2" },
      lualine_x = { 'filename' },
      lualine_y = {
        recorder_status,
      },
      lualine_z = {
        recorder_slots,
      }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  }
}
