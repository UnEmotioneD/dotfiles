return {
  'Jezda1337/nvim-html-css',
  opts = {
    enable_on = { 'html', 'jsx' },
    handlers = {
      definition = {
        bind = 'gd',
      },
      hover = {
        bind = 'K',
        wrap = true,
        border = 'none',
        position = 'cursor',
      },
    },
    documentation = {
      auto_show = true,
    },
    style_sheets = {},
  },
}
