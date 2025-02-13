return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  opts = {
    delay = 300,
    icons = {
      mappings = vim.g.have_nerd_font,
      keys = vim.g.have_nerd_font and {} or {
        Esc = '<Esc>',
        BS = '<BS>',
      },
    },
    spec = {
      { '<leader>d', group = '[D]ebugger' },
      { '<leader>e', group = '[E]xplorer' },
      { '<leader>f', group = '[F]ind' },
      { '<leader>g', group = 'Chat [G]pt' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      { '<leader>l', group = '[L]ive server' },
      { '<leader>m', group = '[M]arkdown' },
      { '<leader>n', group = '[N]eck pain' },
      { '<leader>q', group = '[Q]uit' },
      { '<leader>s', group = '[S]plit' },
      { '<leader>t', group = '[T]ab' },
      { '<leader>x', group = '[X]trouble' },
    },
  },
}
