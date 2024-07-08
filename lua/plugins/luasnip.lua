return {
  "L3MON4D3/LuaSnip",
  lazy = true,
  config = function()
    local ls = require("luasnip")

    ls.config.setup({
      history = true,
      updateevents = "TextChanged,TextChangedI",
      override_builtin = true,
    })

    -- keymaps
    vim.keymap.set({ "i", "s" }, "<C-h>", function() ls.jump(-1) end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-l>", function() ls.jump(1) end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-e>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })

    -- load snippets
    for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/snippets/*.lua", true)) do
      loadfile(ft_path)()
    end
  end
}
