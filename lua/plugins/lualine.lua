local function buf_mark_status()
  local marks = vim.fn.getmarklist(vim.fn.bufnr "%")
  local result = {}
  for _, mark in ipairs(marks) do
    if mark.mark:match "[a-z]" then
      table.insert(result, mark.mark)
    end
  end

  return table.concat(result, " ")
end

local function global_mark_status()
  local marks = vim.fn.getmarklist()
  local result = {}
  for _, mark in ipairs(marks) do
    if mark.mark:match "[A-Z]" then
      table.insert(result, mark.mark)
    end
  end

  return table.concat(result, " ")
end

local function function_context()
  local cursor_line = vim.api.nvim_win_get_cursor(0)[1]
  local total_lines = vim.api.nvim_buf_line_count(0)

  for i = cursor_line, 1, -1 do
    local line_content = vim.api.nvim_buf_get_lines(0, i - 1, i, false)[1] or ""

    local function_name = line_content:match("function%s+(%w+)%s*%(") or
        line_content:match("async function%s+(%w+)%s*%(") or
        line_content:match("def%s+(%w+)%s*%(") or
        line_content:match("fn%s+(%w+)%s*%(") or
        line_content:match("const%s+(%w+)%s*=%s*%(") or
        line_content:match("let%s+(%w+)%s*=%s*%(") or
        line_content:match("var%s+(%w+)%s*=%s*%(") or
        line_content:match("(%w+)%s*:%s*function") or
        line_content:match("(%w+)%s*=%s*function") or
        line_content:match("(%w+)%s*=%s*async function") or
        line_content:match("async%s+(%w+)%s*%(") or
        line_content:match("class%s+(%w+)") or
        line_content:match("interface%s+(%w+)") or
        line_content:match("struct%s+(%w+)")

    if function_name and function_name ~= "" then
      return "📍 " .. function_name
    end

    local stripped_line = line_content:gsub("^%s+", "")
    local method_name = stripped_line:match("^(%w+)%s*%(.*%)%s*{") or
        stripped_line:match("^(%w+)%s*%(.*%)%s*[-=]>")

    if method_name and method_name ~= "" and
        not (method_name == "if" or method_name == "while" or method_name == "for" or
          method_name == "switch" or method_name == "catch" or method_name == "function") then
      return "📍 " .. method_name
    end
  end

  return ""
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
          function_context,
          buf_mark_status,
          " ",
          global_mark_status,
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
