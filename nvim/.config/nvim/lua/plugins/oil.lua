return {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = {
    { "echasnovski/mini.icons", lazy = false },
    { "nvim-tree/nvim-web-devicons" }
  },
  config = function()
    local oil = require("oil")
    oil.setup(
            {
                    default_file_explorer = true,
                    delete_to_trash = true,
                    skip_confirm_for_simple_edits = true,
                    view_options = {
                            show_hidden = true,
                            natural_order = true,
                            is_always_hidden = function(name, _)
                                    return name == '..' or name == '.git'
                            end,
                    },
                    win_options = {
                            wrap = true,
                    }
            })
    vim.keymap.set("n", "-", oil.toggle_float, {})
  end,
  lazy = false,
}
