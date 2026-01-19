return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false }, -- Disable built-in suggestions
        panel = { enabled = false }, -- Disable built-in panel
      })
    end,
  },
}
