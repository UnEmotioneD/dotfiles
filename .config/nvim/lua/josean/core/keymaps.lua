vim.g.mapleader = ' '

local keymap = vim.keymap

---------------------
-- General Keymaps --
---------------------

keymap.set('n', '<leader>nh', '<Cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- Delete single character without copying into register
keymap.set('n', 'x', '"_x')

keymap.set('n', '<leader>+', '<C-a>', { desc = 'Increment number' })
keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' })

keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' })
keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' })
keymap.set('n', '<leader>sx', '<Cmd>close<CR>', { desc = 'Close current split' })

keymap.set('n', '<leader>to', '<Cmd>tabnew<CR>', { desc = 'Open new tab' })
keymap.set('n', '<leader>tx', '<Cmd>tabclose<CR>', { desc = 'Close current tab' })
keymap.set('n', '<leader>tn', '<Cmd>tabn<CR>', { desc = 'Go to next tab' })
keymap.set('n', '<leader>tp', '<Cmd>tabp<CR>', { desc = 'Go to previous tab' })
keymap.set('n', '<leader>tf', '<Cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' })

-- write / quit
keymap.set('n', '<leader>ww', '<Cmd>w<CR>', { desc = 'Write current file changes' })
keymap.set('n', '<leader>wa', '<Cmd>wa<CR>', { desc = 'Write every changes' })
keymap.set('n', '<leader>qq', '<Cmd>q<CR>', { desc = 'Quit current buffer' })
keymap.set('n', '<leader>qa', '<Cmd>qa<CR>', { desc = 'Quit Nvim' })
keymap.set('n', '<leader>wq', '<Cmd>wqa<CR>', { desc = 'Write and quit Nvim' })

keymap.set('n', '<leader>dm', '<Cmd>delmarks!<CR>', { desc = 'Delete all marks' })

keymap.set('n', 'Y', 'y$', { desc = 'Yank to end of the line' })

-- Unbind keymaps to avoid collision with tmux keybinds
keymap.set('', '<C-n>', '<Nop>', { noremap = true, silent = true })
keymap.set('', '<C-p>', '<Nop>', { noremap = true, silent = true })

-- Center window when navigating through search
keymap.set('n', 'n', 'nzz')
keymap.set('n', 'N', 'Nzz')

---------------------
-- Plugin Keymaps --
---------------------

-- Auto-session
keymap.set('n', '<leader>wr', '<Cmd>SessionRestore<CR>', { desc = 'Restore session for cwd' })
keymap.set('n', '<leader>ws', '<Cmd>SessionSave<CR>', { desc = 'Save session for auto session root dir' })

-- Crates
keymap.set('n', '<leader>rcu', function()
  require('crates').upgrade_all_crates()
end, { desc = 'Update crates' })

-- ChatGPT
keymap.set('n', '<leader>go', '<Cmd>ChatGPT<CR>', { desc = 'Open normal ChatGPT' })
keymap.set('n', '<leader>ge', '<Cmd>ChatGPTEditWithInstruction<CR>', { desc = 'Edit with instruction' })
keymap.set('n', '<leader>gg', '<Cmd>ChatGPTRun grammar_correction<CR>', { desc = 'Correct grammer' })
keymap.set('n', '<leader>gf', '<Cmd>ChatGPTRun fix_bugs<CR>', { desc = 'Fix bugs' })

-- Flash
keymap.set('n', '<leader>fl', function()
  require('flash').jump()
end, { desc = 'Flash' })

-- Conform
keymap.set({ 'n', 'v' }, '<leader>fm', function()
  require('conform').format()
end, { desc = 'Format file or range (in visual mode)' })

-- Lazygit
keymap.set('n', '<leader>lg', '<Cmd>LazyGit<CR>', { desc = 'Open lazygit' })

-- Lint
keymap.set('n', '<leader>l', function()
  require('lint').try_lint()
end, { desc = 'Trigger linting for current file' })

-- Live server
keymap.set('n', '<leader>lo', '<Cmd>LiveServerStart<CR>', { desc = 'Live server open' })
keymap.set('n', '<leader>lc', '<Cmd>LiveServerStop<CR>', { desc = 'Live server stop' })
keymap.set('n', '<leader>lt', '<Cmd>LiveServerToggle<CR>', { desc = 'Live server toggle' })

-- Tree
keymap.set('n', '<leader>ee', '<Cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
keymap.set('n', '<leader>ef', '<Cmd>NvimTreeFindFileToggle<CR>', { desc = 'Toggle file explorer on current file' })
keymap.set('n', '<leader>ec', '<Cmd>NvimTreeCollapse<CR>', { desc = 'Collapse file explorer' })
keymap.set('n', '<leader>er', '<Cmd>NvimTreeRefresh<CR>', { desc = 'Refresh file explorer' })

-- Oil
keymap.set('n', '-', '<Cmd>Oil<CR>', { desc = 'Open parent directory' })

-- Todo
keymap.set('n', '<leader>]t', function()
  require('todo-comments').jump_next()
end, { desc = 'Next todo comment' })

keymap.set('n', '<leader>[t', function()
  require('todo-comments').jump_prev()
end, { desc = 'Previous todo comment' })

-- Telescope
keymap.set('n', '<leader>ff', '<Cmd>Telescope find_files<CR>', { desc = 'Fuzzy find files in cwd' })
keymap.set('n', '<leader>fr', '<Cmd>Telescope oldfiles<CR>', { desc = 'Fuzzy find recent files' })
keymap.set('n', '<leader>fs', '<Cmd>Telescope live_grep<CR>', { desc = 'Find string in cwd' })
keymap.set('n', '<leader>fc', '<Cmd>Telescope grep_string<CR>', { desc = 'Find string under cursor in cwd' })
keymap.set('n', '<leader>ft', '<Cmd>TodoTelescope<CR>', { desc = 'Find todos' })

-- Trouble
keymap.set('n', '<leader>xw', '<Cmd>Trouble diagnostics toggle<CR>', { desc = 'Open trouble workspace diagnostics' })
keymap.set('n', '<leader>xd', '<Cmd>Trouble diagnostics toggle filter.buf=0<CR>', { desc = 'Open trouble document diagnostics' })
keymap.set('n', '<leader>xq', '<Cmd>Trouble quickfix toggle<CR>', { desc = 'Open trouble quickfix list' })
keymap.set('n', '<leader>xl', '<Cmd>Trouble loclist toggle<CR>', { desc = 'Open trouble location list' })
keymap.set('n', '<leader>xt', '<Cmd>Trouble todo toggle<CR>', { desc = 'Open todos in trouble' })

-- Vim-maximizer
keymap.set('n', '<leader>sm', '<Cmd>MaximizerToggle<CR>', { desc = 'Maximize/minimize a split' })
