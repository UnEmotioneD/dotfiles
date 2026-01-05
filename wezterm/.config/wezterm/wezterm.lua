local wezterm = require('wezterm')

wezterm.on('format-window-title', function()
  return 'WezTerm'
end)

return {
  color_scheme = 'tokyonight-storm',

  enable_tab_bar = false,

  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },

  font_size = 14,

  font = wezterm.font({
    family = 'JetBrainsMono Nerd Font',
    harfbuzz_features = { 'liga=1', 'clig=1', 'calt=1' },
  }),

  max_fps = 144,
}
