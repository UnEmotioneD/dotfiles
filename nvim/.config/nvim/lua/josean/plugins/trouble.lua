return {
  'folke/trouble.nvim',
  opts = {
    focus = true,
  },
  keys = {
    { '<leader>xd', ':Trouble diagnostics toggle filter.buf=0<CR>', desc = 'Buffer diagnostics' },
    { '<leader>xl', ':Trouble loclist toggle<CR>', desc = 'Location list' },
    { '<leader>xq', ':Trouble quickfix toggle<CR>', desc = 'Quickfix list' },
    { '<leader>xt', ':Trouble todo toggle<CR>', desc = 'Todos' },
  },
}
