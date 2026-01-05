return {
  'CopilotC-Nvim/CopilotChat.nvim',
  dependencies = { 'github/copilot.vim' },
  build = 'make tiktoken',
  opts = {},
  keymaps = {
    vim.keymap.set('n', '<leader>aco', '<cmd>CopilotChatOpen<CR>', { desc = 'Open chat window' }),
    vim.keymap.set('n', '<leader>acc', '<cmd>CopilotChatClose<CR>', { desc = 'Close chat window' }),
  },
}
