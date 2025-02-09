local wezterm = require("wezterm")

local config = wezterm.config_builder()

config = {
	automatically_reload_config = true,
	font = wezterm.font("Fira Code", { weight = "Bold" }),
	font_size = 16,
	-- enable ligature
	harfbuzz_features = { "calt=1", "liga=1" },

	enable_tab_bar = false,

	window_decorations = "RESIZE",
	window_background_opacity = 0.85,
	window_padding = {
		left = 15,
		right = 15,
		top = 15,
		bottom = 15,
	},

	color_scheme = "Tokyo Night Storm",
}

return config
