return {
  'tpope/vim-fugitive',
  lazy = true,
  cmd = { 'Gvdiffsplit' },
  keys = {
    { '<leader>gd', '<cmd>Gvdiffsplit!<CR>', desc = '3-way diff' },
    { '<leader>gh', '<cmd>diffget //2<CR>', desc = 'Accept Local (Left)' },
    { '<leader>gl', '<cmd>diffget //3<CR>', desc = 'Accept Remote (Right)' },
  },
}
