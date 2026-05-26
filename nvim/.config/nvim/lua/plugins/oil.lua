return {
  "stevearc/oil.nvim",
  opts = {},
  dependencies = {
    { "echasnovski/mini.icons", lazy = false },
  },
  config = function()
    -- Set up mini.icons as the icon provider and mock nvim-web-devicons for
    -- plugins that require it (lualine, telescope, etc.)
    require('mini.icons').setup()
    require('mini.icons').mock_nvim_web_devicons()

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
    -- vim.keymap.set("n", "-", oil.toggle_float, {})

    -- Keymap for toggling the float window
    vim.keymap.set("n", "<Tab>", function()
        if vim.bo.filetype == "oil" then
            vim.cmd("bd") -- Close buffer if it's an oil buffer
        else
            require("oil").open_float() -- Open as float if not oil
        end
    end, { noremap = true, silent = true, desc = "Toggle Oil" })

  end,
  lazy = false,
}
