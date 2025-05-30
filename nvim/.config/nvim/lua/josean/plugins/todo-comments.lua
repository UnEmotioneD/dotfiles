return {
  'folke/todo-comments.nvim',
  opts = {},
  key = {
    {
      '[t',
      function()
        require('todo-comments').jump_prev()
      end,
      desc = 'Previous todo comment',
    },
    {
      ']t',
      function()
        require('todo-comments').jump_next()
      end,
      desc = 'Next todo comment',
    },
    { '<leader>ft', ':TodoTelescope<CR>', desc = '[f]ind [t]odos' },
  },
}
