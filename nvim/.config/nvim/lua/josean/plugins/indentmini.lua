return {
  'nvimdev/indentmini.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    char = '│',
    exclude = { 'markdown' },
    minlevel = 1,
    only_current = false,
  },
}
