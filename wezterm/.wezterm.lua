local wezterm = require("wezterm")

local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	font = wezterm.font("MesloLGS Nerd Font Mono", { weight = "Bold" }),
	font_size = 16,
	-- enable ligature
	harfbuzz_features = { "calt=1", "liga=1" },

	enable_tab_bar = false,

	window_decorations = "RESIZE",
	window_background_opacity = 0.85,
	macos_window_background_blur = 20,
	window_padding = {
		left = 20,
		right = 20,
		top = 20,
		bottom = 20,
	},

	max_fps = 240,

	color_scheme = "Tokyo Night Storm",
}

return config
