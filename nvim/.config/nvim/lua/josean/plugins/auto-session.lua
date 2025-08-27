return {
  'rmagatti/auto-session',
  lazy = false,
  init = function()
    vim.opt.sessionoptions = table.concat(
      { 'blank', 'buffers', 'curdir', 'folds', 'help', 'localoptions', 'tabpages', 'terminal', 'winpos', 'winsize' },
      ','
    )
  end,
  opts = {
    auto_restore = false,
    suppressed_dirs = { '~/', '~/Desktop/', '~/Documents/', '~/Downloads/' },
    session_lens = {
      mappings = {
        delete_session = { 'i', '<C-d>' },
      },
    },
  },
  keys = {
    { '<leader>wf', ':AutoSession search<CR>', desc = 'Find' },
    { '<leader>wp', ':AutoSession purgeOrphaned<CR>', desc = 'Purge' },
    { '<leader>wr', ':AutoSession restore<CR>', desc = 'Restore' },
    { '<leader>ws', ':AutoSession save<CR>', desc = 'Save' },
  },
}
