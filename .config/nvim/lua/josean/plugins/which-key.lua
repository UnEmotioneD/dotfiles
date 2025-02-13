return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    delay = 500,
    spec = {
      { '<leader>d', group = '[D]ebugger' },
      { '<leader>e', group = '[E]xplore' },
      { '<leader>g', group = '[G]pt' },
      { '<leader>m', group = '[M]arkdown' },
    },
  },
}
