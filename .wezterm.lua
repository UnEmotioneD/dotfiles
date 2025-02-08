local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({
	{ family = "Fira Code", weight = "Bold" },
	{ family = "MesloLGS Nerd Font Mono", weight = "Bold" }, -- fallback font
})
config.font_size = 16

-- enable ligature
config.harfbuzz_features = { "calt=1", "liga=1" }

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

config.color_scheme = "Tokyo Night Storm"

return config
