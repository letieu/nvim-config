local function harpoon_status()
  local char = { "a", "s", "q", "w" }

  local harpoon = require("harpoon")
  local list = harpoon:list()
  local root_dir = list.config:get_root_dir()
  local current_file_path = vim.api.nvim_buf_get_name(0)

  local length = list:length()

  local status = ""

  for i = 1, length do
    local value = list:get(i).value
    local full_path = root_dir .. "/" .. value
    if full_path == current_file_path then
      status = status .. " " .. char[i]:upper()
    else
      status = status .. " " .. char[i]
    end
  end

  return [[ 󰀱 ]] .. status
end

local function recorder_status()
  return require("recorder").recordingStatus()
end

local function recorder_slots()
  return require("recorder").displaySlots()
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "ThePrimeagen/harpoon", "chrisgrieser/nvim-recorder" },
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
      lualine_c = { '%=', harpoon_status },
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
