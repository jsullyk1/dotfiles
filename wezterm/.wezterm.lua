local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Include per-user Windows fonts even when DirectWrite misses them.
if wezterm.target_triple:find("windows") then
  config.font_dirs = { wezterm.home_dir .. "/AppData/Local/Microsoft/Windows/Fonts" }
end

-- Match kitty/.config/kitty/kitty.conf.
config.font = wezterm.font("JetBrainsMono Nerd Font Mono")
config.font_size = 13
config.window_background_opacity = 0.96
-- WezTerm exposes background blur on macOS only.
config.macos_window_background_blur = 6
config.window_padding = { left = 10, right = 10, top = 10, bottom = 10 }
config.initial_cols = 100
config.initial_rows = 20
config.audible_bell = "Disabled"
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- OneDark Pro: same palette as kitty/themes/OneDark-Pro.conf.
config.colors = {
  foreground = "#ABB2BF",
  background = "#282C34",
  cursor_bg = "#ABB2BF",
  cursor_fg = "#282C34",
  cursor_border = "#ABB2BF",
  selection_fg = "#282C34",
  selection_bg = "#ABB2BF",
  ansi = {
    "#3F4451", "#E06C75", "#98C379", "#D19A66",
    "#61AFEF", "#C678DD", "#56B6C2", "#D7DAE0",
  },
  brights = {
    "#4F5666", "#BE5046", "#A5E075", "#E5C07B",
    "#4DC4FF", "#DE73FF", "#4CD1E0", "#E6E6E6",
  },
  tab_bar = {
    background = "#282C34",
    active_tab = { fg_color = "#3F4451", bg_color = "#D7DAE0" },
    inactive_tab = { fg_color = "#ABB2BF", bg_color = "#282C34" },
  },
}

-- Leave Ctrl+h/j/k/l available for Herdr and Neovim navigation.
return config
