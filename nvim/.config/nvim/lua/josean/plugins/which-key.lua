return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  init = function()
    vim.opt.timeout = true
    vim.opt.timeoutlen = 500
  end,
  opts = {
    preset = 'helix',
    delay = 500,
    plugins = {
      spelling = {
        suggestions = 6,
      },
    },
    keys = {
      scroll_down = '<C-f>',
      scroll_up = '<C-b>',
    },
    icons = {
      keys = {
        Space = '<SPACE>',
        Esc = '<ESC>',
        BS = '<BS>',
        F1 = '<F1>',
        F2 = '<F2>',
        F3 = '<F3>',
        F4 = '<F4>',
        F5 = '<F5>',
        F6 = '<F6>',
        F7 = '<F7>',
        F8 = '<F8>',
        F9 = '<F9>',
        F10 = '<F10>',
        F11 = '<F11>',
        F12 = '<F12>',
      },
    },
    spec = {
      { '<leader>c', group = 'Conform' },
      { '<leader>e', group = 'Explorer' },
      { '<leader>f', group = 'Find' },
      { '<leader>g', group = 'Git' },
      { '<leader>h', group = 'Git Hunk', mode = { 'n', 'v' } },
      { '<leader>l', group = 'Live-server' },
      { '<leader>m', group = 'Markdown' },
      { '<leader>q', group = 'Quicker' },
      { '<leader>s', group = 'Split' },
      { '<leader>u', group = 'Undotree' },
      { '<leader>w', group = 'Session' },
      { '<leader>x', group = 'Trouble' },
      { '<leader>z', group = 'ZenMode' },
    },
    win = {
      border = 'single',
    },
  },
}
