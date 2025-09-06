return {
  'rmagatti/auto-session',
  lazy = false,
  init = function()
    vim.opt.sessionoptions = table.concat({
      'blank',
      'buffers',
      'curdir',
      'folds',
      'help',
      'localoptions',
      'tabpages',
      'terminal',
      'winpos',
      'winsize',
    }, ',')
  end,
  opts = {
    auto_restore = false,
    suppressed_dirs = {
      '~/',
      '~/Desktop/',
      '~/Documents/',
      '~/Downloads/',
    },
    session_lens = {
      mappings = {
        delete_session = {
          'i',
          '<C-d>',
        },
      },
    },
  },
  keys = {
    { '<leader>wr', ':AutoSession restore<CR>', desc = 'Restore' },
  },
}
