return {
  'Wansmer/treesj',
  config = function()
    local treesj = require('treesj')

    treesj.setup({
      use_default_keymaps = false,
      max_join_length = 120,
      cursor_behavior = 'start',
    })

    vim.keymap.set('n', '<leader>st', treesj.toggle, { desc = 'Treesitter' })
  end,
}
