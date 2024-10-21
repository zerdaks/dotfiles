local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha (Gogh)"

config.default_prog = { "/opt/homebrew/bin/fish", "-l" }

config.font = wezterm.font("Hack Nerd Font")
config.font_size = 11.5

config.hide_tab_bar_if_only_one_tab = true

config.window_background_opacity = 0.7
config.window_decorations = "RESIZE"

config.macos_window_background_blur = 10

return config
