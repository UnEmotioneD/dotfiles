return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = false,

  vim.keymap.set('n', '-', '<cmd>Oil<CR>', { desc = 'Open parent directory' }),
}
