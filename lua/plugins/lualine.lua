local function mark_status()
  local marks = vim.fn.getmarklist(vim.fn.bufnr "%")
  local result = {}
  for _, mark in ipairs(marks) do
    if mark.mark:match "[a-z]" then
      table.insert(result, mark.mark)
    end
  end

  return table.concat(result, " ")
end

return {
  "nvim-lualine/lualine.nvim",
  event = "UiEnter",
  config = function()
    require("lualine").setup {
      options = {
        component_separators = "",
        section_separators = "",
        disabled_filetypes = {
          statusline = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = { "branch" },
        lualine_b = { "diagnostics" },
        lualine_c = {
          "%=",
          "grapple",
          "filename",
          mark_status,
        },
        lualine_x = {
          "filetype",
        },
        lualine_y = {
          "progress",
        },
        lualine_z = {
          "location",
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
    }
  end,
}
