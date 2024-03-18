local function recorder_status()
  return require("recorder").recordingStatus()
end

local function recorder_slots()
  return require("recorder").displaySlots()
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "chrisgrieser/nvim-recorder" },
  event = "VimEnter",
  config = function()
    require("lualine").setup({
      options = {
        component_separators = "",
        section_separators = "",
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {
          '%=',
          {
            icon = "󰀱 ",
            "grapple"
          }
        },
        lualine_x = { 'filename' },
        lualine_y = {
          recorder_status,
          'progress'
        },
        lualine_z = {
          'location',
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
    })
  end
}
