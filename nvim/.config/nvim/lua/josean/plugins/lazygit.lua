return {
  'kdheepak/lazygit.nvim',
  event = 'VeryLazy',
  config = function()
    vim.g.lazygit_floating_window_scaling_factor = 1
    vim.keymap.set('n', '<leader>hg', ':LazyGit<CR>', { desc = 'LazyGit' })
  end,
}
