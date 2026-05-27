-- lazy.nvim
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "recording",
        },
        view = "popup", -- or "cmdline" or "statusline"
        opts = {
          enter = true,
          -- optional: add a title to the popup
          -- title = "Recording Macro",
        },
      },
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    {
      "rcarriga/nvim-notify",
      opts = {
        -- Required when the theme has a transparent background — tells nvim-notify
        -- what colour to treat as 100% transparent. Set this to your terminal's
        -- background colour for accurate blending; #000000 is a safe default.
        background_colour = "#000000",
      },
    },
  },
}
