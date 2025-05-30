return {
  '0x00-ketsu/maximizer.nvim',
  keys = {
    {
      '<leader>sm',
      function()
        require('maximizer').toggle()
      end,
      desc = 'Max/restore',
    },
  },
}
