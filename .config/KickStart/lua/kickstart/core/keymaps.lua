vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
--  for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
--  is not what someone will guess without a bit more experience.

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Unbind keymaps to avoid collision with tmux keybinds
vim.keymap.set('', '<C-n>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set('', '<C-p>', '<Nop>', { noremap = true, silent = true })

-- Center window when navigating through search
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- Write / Quit
vim.keympa.set('n', '<leader>ww', '<cmd>w<CR>', { desc = 'Write current file' })
vim.keympa.set('n', '<leader>wa', '<cmd>wa<CR>', { desc = 'Write all files' })
vim.keympa.set('n', '<leader>qq', '<cmd>q<CR>', { desc = 'Quite current buffer' })
vim.keympa.set('n', '<leader>qa', '<cmd>qa<CR>', { desc = 'Quite all buffers' })
vim.keympa.set('n', '<leader>wq', '<cmd>wqa<CR>', { desc = 'Write and quite all buffers' })
