return {
  'CopilotC-Nvim/CopilotChat.nvim',
  dependencies = { 'github/copilot.vim' },
  build = 'make tiktoken',
  opts = {},
  config = function()
    local map = vim.keymap.set

    map('n', '<leader>aco', '<cmd>CopilotChatOpen<CR>', { desc = 'Open chat window' })
    map('n', '<leader>acc', '<cmd>CopilotChatClose<CR>', { desc = 'Close chat window' })
    map('n', '<leader>acr', '<cmd>CopilotChatReset<CR>', { desc = 'Reset chat window' })
  end,
}
