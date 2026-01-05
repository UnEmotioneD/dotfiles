local wezterm = require('wezterm')

-- TODO: fixed window title value for i3

return {
  font = wezterm.font('MesloLGS Nerd Font'),
  font_size = 14,

  enable_tab_bar = false,

  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },

  color_scheme = 'tokyonight-storm',

  max_fps = 144,
}
