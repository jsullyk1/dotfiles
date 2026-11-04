-- <C-h/j/k/l> moves between nvim splits, then out into the surrounding
-- multiplexer pane at the edge.
--   * inside herdr: handled here, by calling `herdr pane focus` at the edge
--     (herdr side lives in herdr/.config/herdr/navigate.sh)
--   * otherwise (tmux): vim-tmux-navigator
local herdr_pane = vim.env.HERDR_PANE_ID

if herdr_pane then
  local herdr = vim.env.HERDR_BIN_PATH or "herdr"
  local function navigate(wincmd, direction)
    return function()
      local win = vim.api.nvim_get_current_win()
      vim.cmd.wincmd(wincmd)
      if vim.api.nvim_get_current_win() == win then
        vim.system({ herdr, "pane", "focus", "--direction", direction, "--pane", herdr_pane })
      end
    end
  end
  vim.keymap.set("n", "<c-h>", navigate("h", "left"), { desc = "Window/pane left" })
  vim.keymap.set("n", "<c-j>", navigate("j", "down"), { desc = "Window/pane down" })
  vim.keymap.set("n", "<c-k>", navigate("k", "up"), { desc = "Window/pane up" })
  vim.keymap.set("n", "<c-l>", navigate("l", "right"), { desc = "Window/pane right" })
end

return {
  "christoomey/vim-tmux-navigator",
  cond = herdr_pane == nil,
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },
  keys = {
    { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  },
}
