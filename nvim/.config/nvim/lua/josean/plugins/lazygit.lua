return {
  'kdheepak/lazygit.nvim',
  event = 'VeryLazy',
  config = function()
    vim.keymap.set('n', '<leader>hg', ':LazyGit<CR>', { desc = 'LazyGit' })
  end,
}
