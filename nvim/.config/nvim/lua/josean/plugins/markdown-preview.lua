return {
  'iamcco/markdown-preview.nvim',
  ft = 'markdown',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
  end,
  config = function()
    vim.keymap.set('n', '<leader>mp', ':MarkdownPreview<CR>', { desc = '[m]arkdown [p]erview' })
  end,
}
