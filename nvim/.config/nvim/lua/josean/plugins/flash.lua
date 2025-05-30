return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {
    jump = {
      register = true,
      nohlsearch = true,
    },
    modes = {
      char = {
        enabled = false,
      },
    },
  },
  keys = {
    {
      '<leader><CR>',
      function()
        require('flash').jump()
      end,
      desc = 'Flash',
    },
    {
      mode = 'o',
      '<leader><CR>',
      function()
        require('flash').remote()
      end,
      desc = 'Remote Flash',
    },
  },
}
