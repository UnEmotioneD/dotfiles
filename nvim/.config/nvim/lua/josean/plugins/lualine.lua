return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      globalstatus = true,
    },
    sections = {
      lualine_x = { 'filesize' },
    },
    extensions = {
      'lazy',
      'mason',
      'nvim-tree',
      'oil',
      'quickfix',
      'trouble',
    },
  },
}
