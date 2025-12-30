return {
  "rmagatti/auto-session",
  lazy = false, ---enables autocomplete for opts
  keys = {
    -- Will use Telescope if installed or a vim.ui.select picker otherwise
    { "<leader>wr", "<cmd>AutoSession search<CR>", desc = "Session search" },
    { "<leader>ws", "<cmd>AutoSession save<CR>", desc = "Save session" },
    { "<leader>wa", "<cmd>AutoSession toggle<CR>", desc = "Toggle autosave" },
  },
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
  },
}
