return {
  "letieu/99",
  -- "ThePrimeagen/99",
  config = function()
    local _99 = require("99")
    _99.setup({
      provider = _99.OpenCodeProvider,
      model = "google/antigravity-gemini-3-flash",
      md_files = {
        "AGENT.md",
      },
    })

    vim.keymap.set("v", "<leader>9v", function()
      _99.visual()
    end)

    --- if you have a request you dont want to make any changes, just cancel it
    vim.keymap.set("v", "<leader>9s", function()
      _99.stop_all_requests()
    end)
  end,
}
