vim.g.mapleader = ' '

local keymap = vim.keymap

---------------------
-- General Keymaps --
---------------------

keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- Delete single character without copying into register
keymap.set('n', 'x', '"_x')

keymap.set('n', '<leader>+', '<C-a>', { desc = 'Increment number' })
keymap.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' })

keymap.set('n', '<leader>sv', '<C-w>v', { desc = '[s]plit [v]ertically' })
keymap.set('n', '<leader>sh', '<C-w>s', { desc = '[s]plit [h]orizontally' })
keymap.set('n', '<leader>se', '<C-w>=', { desc = '[s]plit into [e]qual size' })
keymap.set('n', '<leader>sx', '<Cmd>close<CR>', { desc = '[s]plit [x]close' })

keymap.set('n', '<leader>to', '<Cmd>tabnew<CR>', { desc = '[t]ab [o]pen' })
keymap.set('n', '<leader>tx', '<Cmd>tabclose<CR>', { desc = '[t]ab [x]close' })
keymap.set('n', '<leader>tn', '<Cmd>tabn<CR>', { desc = '[t]ab [n]ext' })
keymap.set('n', '<leader>tp', '<Cmd>tabp<CR>', { desc = '[t]ab [p]revious' })
keymap.set('n', '<leader>tf', '<Cmd>tabnew %<CR>', { desc = '[t]ab [f]ile(current buffer in new tab)' })

-- write / quit
keymap.set('n', '<leader>ww', '<Cmd>w<CR>', { desc = 'Write changse in current buffer' })
keymap.set('n', '<leader>wa', '<Cmd>wa<CR>', { desc = 'Write every changes' })
keymap.set('n', '<leader>qq', '<Cmd>q<CR>', { desc = 'Quit current window' })
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
keymap.set('n', '<leader>uc', function()
  require('crates').upgrade_all_crates()
end, { desc = 'Update crates' })

-- ChatGPT
keymap.set('n', '<leader>go', '<Cmd>ChatGPT<CR>', { desc = '[g]pt [o]pen' })
keymap.set('n', '<leader>ge', '<Cmd>ChatGPTEditWithInstruction<CR>', { desc = '[g]pt [e]dit with instruction' })
keymap.set('n', '<leader>gg', '<Cmd>ChatGPTRun grammar_correction<CR>', { desc = '[g]pt Correct [g]rammer' })
keymap.set('n', '<leader>gf', '<Cmd>ChatGPTRun fix_bugs<CR>', { desc = '[g]pt [f]ix bugs' })

-- Flash
keymap.set('n', '<leader><leader>f', function()
  require('flash').jump()
end, { desc = '[f]lash' })

-- Conform
keymap.set({ 'n', 'v' }, '<leader>p', function()
  require('conform').format()
end, { desc = 'Format file (in range)' })

-- Lazygit
keymap.set('n', '<leader>hg', '<Cmd>LazyGit<CR>', { desc = 'Lazy[g]it' })

-- Lint
keymap.set('n', '<leader>ll', function()
  require('lint').try_lint()
end, { desc = 'Trigger linting for current file' })

-- Live server
keymap.set('n', '<leader>lo', '<Cmd>LiveServerStart<CR>', { desc = '[l]ive server [o]pen' })
keymap.set('n', '<leader>lc', '<Cmd>LiveServerStop<CR>', { desc = '[l]ive server [s]top' })
keymap.set('n', '<leader>lt', '<Cmd>LiveServerToggle<CR>', { desc = '[l]ive server [t]oggle' })

-- Tree
keymap.set('n', '<leader>ee', '<Cmd>NvimTreeToggle<CR>', { desc = '[e]xplorer toggle' })
keymap.set('n', '<leader>ef', '<Cmd>NvimTreeFindFileToggle<CR>', { desc = '[e]xplorer on current [f]ile' })
keymap.set('n', '<leader>ec', '<Cmd>NvimTreeCollapse<CR>', { desc = '[e]explorer [c]ollapse' })
keymap.set('n', '<leader>er', '<Cmd>NvimTreeRefresh<CR>', { desc = '[e]xplorer [r]efresh' })

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
keymap.set('n', '<leader>ff', '<Cmd>Telescope find_files<CR>', { desc = '[f]ind [f]iles' })
keymap.set('n', '<leader>fr', '<Cmd>Telescope oldfiles<CR>', { desc = '[f]ind [r]ecent' })
keymap.set('n', '<leader>fs', '<Cmd>Telescope live_grep<CR>', { desc = '[f]ind [s]tring in cwd' })
keymap.set('n', '<leader>fc', '<Cmd>Telescope grep_string<CR>', { desc = '[f]ind string under [c]ursor in cwd' })
keymap.set('n', '<leader>ft', '<Cmd>TodoTelescope<CR>', { desc = '[f]ind [t]odos' })

-- Trouble
keymap.set('n', '<leader>xw', '<Cmd>Trouble diagnostics toggle<CR>', { desc = 'Open trouble [w]orkspace diagnostics' })
keymap.set(
  'n',
  '<leader>xd',
  '<Cmd>Trouble diagnostics toggle filter.buf=0<CR>',
  { desc = 'Open trouble [d]ocument diagnostics' }
)
keymap.set('n', '<leader>xq', '<Cmd>Trouble quickfix toggle<CR>', { desc = 'Open trouble [q]uickfix list' })
keymap.set('n', '<leader>xl', '<Cmd>Trouble loclist toggle<CR>', { desc = 'Open trouble [l]ocation list' })
keymap.set('n', '<leader>xt', '<Cmd>Trouble todo toggle<CR>', { desc = 'Open [t]odos in trouble' })

-- Vim-maximizer
keymap.set('n', '<leader>sm', '<Cmd>MaximizerToggle<CR>', { desc = '[s]plit to [m]ax/min' })
