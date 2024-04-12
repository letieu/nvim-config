local function recordStatus()
  local reg = vim.fn.reg_recording()
  if reg == "" then
    return ""
  end -- not recording
  return "󰑋 " .. reg
end

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "chrisgrieser/nvim-recorder" },
  event = "VimEnter",
  config = function()
    require("lualine").setup {
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
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = {
          "%=",
          {
            icon = "⚓",
            "grapple",
          },
          "filename"
        },
        lualine_y = {
          "progress",
        },
        lualine_z = {
          "location",
          recordStatus,
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    }
  end,
}
