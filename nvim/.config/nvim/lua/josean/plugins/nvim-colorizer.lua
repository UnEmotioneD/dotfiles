return {
  'catgoose/nvim-colorizer.lua',
  event = 'BufReadPre',
  opts = {
    lazy_load = false,
    user_default_options = {
      names = false,
      names_opts = {
        strip_digits = true,
      },
      RRGGBBAA = true,
      AARRGGBB = true,
      rgb_fn = true, -- rgb(), rgba()
      hsl_fn = true, -- hsl(), hsla()
      css = true,
      css_fn = true,
      mode = 'background',
    },
  },
}
