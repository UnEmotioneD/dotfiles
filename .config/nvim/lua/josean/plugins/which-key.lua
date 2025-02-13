return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    delay = 300,
    spec = {
      { '<leader>d', group = '[D]ebugger' },
      { '<leader>m', group = '[M]arkdown' },
    },
  },
}
