return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Optional
  lazy = false,
  config = function()
    require('oil').setup {
      view_options = {
        show_hidden = true,
      },
    }
  end,
  vim.keymap.set('n', '-', '<cmd>Oil<CR>', { desc = 'Open parent directory' }),
}
