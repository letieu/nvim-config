local function fetch_gitignore_templates()
  local url = "https://api.github.com/repos/github/gitignore/contents"
  local curl_cmd = "curl -s " .. url
  local handle = io.popen(curl_cmd)
  local result = handle:read("*a")
  handle:close()

  local json = vim.fn.json_decode(result)

  if not json then return {} end

  local templates = {}
  for _, file in ipairs(json) do
    if file.name:match("%.gitignore$") then
      table.insert(templates, file.name)
    end
  end

  return templates
end

local function download_gitignore(template)
  local url = "https://raw.githubusercontent.com/github/gitignore/main/" .. template
  local gitignore_path = vim.fn.expand("%:p:h") .. "/.gitignore"
  local curl_cmd = "curl -s " .. url .. " -o " .. gitignore_path
  os.execute(curl_cmd)
  vim.notify("Downloaded " .. template .. " .gitignore")
end

vim.api.nvim_create_user_command(
  "GitIgnore",
  function()
    local templates = fetch_gitignore_templates()
    if #templates == 0 then
      print("Failed to fetch .gitignore templates")
      return
    end

    vim.ui.select(templates, { prompt = "Select .gitignore template:" }, function(choice)
      if choice then
        download_gitignore(choice)
      end
    end)
  end,
  {}
)

require("fzf-lua").register_ui_select()
