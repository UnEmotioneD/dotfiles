return {
  'barrett-ruth/live-server.nvim',
  ft = 'html',
  config = function()
    require('live-server').setup()

    vim.keymap.set('n', '<leader>lo', ':LiveServerStart<CR>', { desc = '[l]ive-server [o]pen' })
    vim.keymap.set('n', '<leader>lc', ':LiveServerStop<CR>', { desc = '[l]ive-server [c]lose' })
  end,
}
