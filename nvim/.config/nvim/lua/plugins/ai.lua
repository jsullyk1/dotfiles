return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "github/copilot.vim", lazy = false, commit = "..." }, -- or zbirenbaum/copilot.lua
    { "nvim-lua/plenary.nvim" }, -- Required dependency
    { "nvim-telescope/telescope.nvim" } -- Optional, but recommended for better UI/UX
  },
  config = function()
    require("CopilotChat").setup {
      -- Your configuration options here (optional)
      -- e.g., window layout, keymaps, etc.
    }
  end
}

