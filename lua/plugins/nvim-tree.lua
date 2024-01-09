return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "kyazdani42/nvim-web-devicons",
  },
  config = function()
    local present, nvimtree = pcall(require, "nvim-tree")

    if not present then
      return
    end

    local options = {
      filters = {
        dotfiles = false,
        exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
      },
      disable_netrw = true,
      hijack_netrw = true,
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = false,
      update_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = false,
      },
      view = {
        adaptive_size = true,
        side = "left",
        width = 25,
      },
      git = {
        enable = false,
        ignore = true,
      },
      filesystem_watchers = {
        enable = true,
      },
      actions = {
        open_file = {
          resize_window = true,
        },
      },
      renderer = {
        highlight_git = false,
        highlight_opened_files = "none",

        indent_markers = {
          enable = false,
        },

        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = false,
          },

          glyphs = {
            default = "",
            symlink = "",
            folder = {
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
              symlink_open = "",
              arrow_open = "",
              arrow_closed = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
    }

    vim.g.nvimtree_side = options.view.side

    nvimtree.setup(options)

    -- Rename file
    local path_sep = package.config:sub(1, 1)

    local function trim_sep(path)
      return path:gsub(path_sep .. "$", "")
    end

    local function uri_from_path(path)
      return vim.uri_from_fname(trim_sep(path))
    end

    local function is_sub_path(path, folder)
      path = trim_sep(path)
      folder = trim_sep(path)
      if path == folder then
        return true
      else
        return path:sub(1, #folder + 1) == folder .. path_sep
      end
    end

    local function check_folders_contains(folders, path)
      for _, folder in pairs(folders) do
        if is_sub_path(path, folder) then
          return true
        end
      end
      return false
    end

    local function match_file_operation_filter(filter, name, type)
      if filter.scheme and filter.scheme ~= "file" then
        -- we do not support uri scheme other than file
        return false
      end
      local pattern = filter.pattern
      local matches = pattern.matches

      if type ~= matches then
        return false
      end

      local regex_str = vim.fn.glob2regpat(pattern.glob)
      if vim.tbl_get(pattern, "options", "ignoreCase") then
        regex_str = "\\c" .. regex_str
      end
      return vim.regex(regex_str):match_str(name) ~= nil
    end

    local api = require("nvim-tree.api")
    api.events.subscribe(api.events.Event.NodeRenamed, function(data)
      local stat = vim.loop.fs_stat(data.new_name)
      if not stat then
        return
      end
      local type = ({ file = "file", directory = "folder" })[stat.type]
      local clients = vim.lsp.get_active_clients({})
      for _, client in ipairs(clients) do
        if check_folders_contains(client.workspace_folders, data.old_name) then
          local filters = vim.tbl_get(client.server_capabilities, "workspace", "fileOperations", "didRename", "filters")
              or {}
          for _, filter in pairs(filters) do
            if
                match_file_operation_filter(filter, data.old_name, type)
                and match_file_operation_filter(filter, data.new_name, type)
            then
              client.notify(
                "workspace/didRenameFiles",
                { files = { { oldUri = uri_from_path(data.old_name), newUri = uri_from_path(data.new_name) } } }
              )
            end
          end
        end
      end
    end)
  end,
}
