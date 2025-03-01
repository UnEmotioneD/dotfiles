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
		left = 15,
		right = 15,
		top = 15,
		bottom = 10,
	},

	max_fps = 240,

	-- Coolnight
	colors = {
		foreground = "#CBE0F0",
		background = "#011423",
		cursor_bg = "#47FF9C",
		cursor_border = "#47FF9C",
		cursor_fg = "#011423",
		selection_bg = "#033259",
		selection_fg = "#CBE0F0",
		ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
		brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },
	},
	-- color_scheme = "Tokyo Night Storm",
}

return config
