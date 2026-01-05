local wezterm = require('wezterm')

-- TODO: fixed window title string for i3

return {
  font_size = 14,

  font = wezterm.font({
    family = 'JetBrainsMono Nerd Font',
    harfbuzz_features = {
      -- !=  ==  ===  =>  ->  <=  >=
      'liga=1', -- standard ligatures
      'clig=1', -- contextual ligatures
      'calt=1', -- contextual alternatives
    },
  }),

  window_decorations = 'RESIZE',

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
