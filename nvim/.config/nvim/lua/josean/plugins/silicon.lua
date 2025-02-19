return {
  'krivahtoo/silicon.nvim',
  build = './install.sh',
  opts = {
    -- Output configuration for the saved image
    output = {
      -- (string) The full path of the file to save to.
      file = '',
      -- (boolean) Whether to copy the image to clipboard instead of saving to file.
      clipboard = false,
      -- (string) Where to save images, defaults to the current directory.
      --  e.g. /home/user/Pictures
      path = '/Users/unemotioned/Documents/codescreenshot',
      -- (string) The filename format to use. Can include placeholders for date and time.
      -- https://time-rs.github.io/book/api/format-description.html#components
      format = 'silicon_[year][month][day]_[hour][minute][second].png',
    },

    -- cmd : silicon --list-fonts
    font = 'MesloLGS Nerd Font Mono=32', -- (string) The font and font size to use for the screenshot.
    -- It can be a theme name or path to a .tmTheme file.
    -- cmd : silicon --list-themes
    theme = 'Visual Studio Dark+',

    -- Background and shadow configuration for the screenshot
    background = '#2e2e2e', -- (string) The background color for the screenshot.
    shadow = {
      blur_radius = 5.0, -- (number) The blur radius for the shadow, set to 0.0 for no shadow.
      offset_x = 10, -- (number) The horizontal offset for the shadow.
      offset_y = 10, -- (number) The vertical offset for the shadow.
      color = '#282828', -- (string) The color for the shadow.
    },

    pad_horiz = 100, -- (number) The horizontal padding.
    pad_vert = 80, -- (number) The vertical padding.
    line_number = true, -- (boolean) Whether to show line numbers in the screenshot.
    line_pad = 2, -- (number) The padding between lines.
    line_offset = 1, -- (number) The starting line number for the screenshot.
    tab_width = 4, -- (number) The tab width for the screenshot.
    gobble = false, -- (boolean) Whether to trim extra indentation.
    highlight_selection = false, -- (boolean) Whether to capture the whole file and highlight selected lines.
    round_corner = false,
    window_controls = true, -- (boolean) Whether to show window controls (minimize, maximize, close) in the screenshot.
    window_title = nil, -- (function) A function that returns the window title as a string.

    -- Watermark configuration for the screenshot
    watermark = {
      text = nil, -- (string) The text to use as the watermark, set to nil to disable.
      color = '#75715e', -- (string) The color for the watermark text.
      -- (string) The style for the watermark text, possible values are:
      -- 'bold', 'italic', 'bolditalic', or anything else defaults to 'regular'.
      style = 'bold',
    },
  },
}
