return {
  'stevearc/oil.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Optional
  lazy = false,
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, bufnr)
        local dsStore = name:match('.DS_Store')
        return dsStore
      end,
    },
  },

  vim.keymap.set('n', '-', '<cmd>Oil<CR>', { desc = 'Open parent directory' }),
}
