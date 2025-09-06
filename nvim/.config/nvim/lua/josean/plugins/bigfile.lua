return {
  'LunarVim/bigfile.nvim',
  opts = {
    filesize = 2,
    pattern = { '*' },
    features = {
      'filetype',
      'lsp',
      'syntax',
      'treesitter',
      'vimopts',
    },
  },
}
