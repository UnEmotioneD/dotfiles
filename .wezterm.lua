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
config.window_background_opacity = 0.85
config.window_padding = {
	left = 15,
	right = 15,
	top = 15,
	bottom = 15,
}

config.macos_window_background_blur = 20

config.color_scheme = "Tokyo Night Storm"

return config
