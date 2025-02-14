vim.g.mapleader = ' '

local m = vim.keymap

---------------------
-- General Keymaps --
---------------------

m.set('n', '<Esc>', '<Cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- Delete single character without copying into register
m.set('n', 'x', '"_x')

-- Move selected up or down keeping the indent
m.set('v', 'J', ":m '>+1<Cr>gv=gv")
m.set('v', 'K', ":m '<-2<Cr>gv=gv")

m.set('n', '<leader>+', '<C-a>', { desc = 'Increment number' })
m.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' })

m.set('n', '<leader>sv', '<C-w>v', { desc = '[s]plit [v]ertically' })
m.set('n', '<leader>sh', '<C-w>s', { desc = '[s]plit [h]orizontally' })
m.set('n', '<leader>se', '<C-w>=', { desc = '[s]plit into [e]qual size' })
m.set('n', '<leader>sx', '<Cmd>close<CR>', { desc = '[s]plit [x]close' })

m.set('n', '<leader>to', '<Cmd>tabnew<CR>', { desc = '[t]ab [o]pen' })
m.set('n', '<leader>tx', '<Cmd>tabclose<CR>', { desc = '[t]ab [x]close' })
m.set('n', '<leader>tn', '<Cmd>tabn<CR>', { desc = '[t]ab [n]ext' })
m.set('n', '<leader>tp', '<Cmd>tabp<CR>', { desc = '[t]ab [p]revious' })
m.set('n', '<leader>tf', '<Cmd>tabnew %<CR>', { desc = '[t]ab [f]ile(current buffer in new tab)' })

-- write / quit
m.set('n', '<leader>ww', '<Cmd>w<CR>', { desc = 'Write changse in current buffer' })
m.set('n', '<leader>wa', '<Cmd>wa<CR>', { desc = 'Write every changes' })
m.set('n', '<leader>qq', '<Cmd>Alpha<CR>', { desc = 'Quit current window' })
m.set('n', '<leader>qa', '<Cmd>qa<CR>', { desc = 'Quit Nvim' })
m.set('n', '<leader>wq', '<Cmd>wqa<CR>', { desc = 'Write and quit Nvim' })

m.set('n', '<leader>dm', '<Cmd>delmarks!<CR>', { desc = 'Delete all marks' })

m.set('n', 'Y', 'y$', { desc = 'Yank to end of the line' })

-- Unbind keymaps to avoid collision with tmux keybinds
m.set('', '<C-n>', '<Nop>', { noremap = true, silent = true })
m.set('', '<C-p>', '<Nop>', { noremap = true, silent = true })

-- Center window when navigating through search
m.set('n', 'n', 'nzz')
m.set('n', 'N', 'Nzz')

m.set('n', '<leader>cs', ':setlocal spell! spell?<CR>', { desc = 'Toggle spell check' })

---------------------
-- Plugin Keymaps --
---------------------

-- Auto-session
m.set('n', '<leader>wr', '<Cmd>SessionRestore<CR>', { desc = 'Restore session for cwd' })
m.set('n', '<leader>ws', '<Cmd>SessionSave<CR>', { desc = 'Save session for auto session root dir' })

-- Crates
m.set('n', '<leader>uc', function()
  require('crates').upgrade_all_crates()
end, { desc = 'Update crates' })

-- ChatGPT
m.set('n', '<leader>go', '<Cmd>ChatGPT<CR>', { desc = '[g]pt [o]pen' })
m.set('n', '<leader>ge', '<Cmd>ChatGPTEditWithInstruction<CR>', { desc = '[g]pt [e]dit with instruction' })
m.set('n', '<leader>gg', '<Cmd>ChatGPTRun grammar_correction<CR>', { desc = '[g]pt Correct [g]rammer' })
m.set('n', '<leader>gf', '<Cmd>ChatGPTRun fix_bugs<CR>', { desc = '[g]pt [f]ix bugs' })

-- Flash
m.set('n', '<leader><leader>f', function()
  require('flash').jump()
end, { desc = '[f]lash' })

-- Conform
m.set({ 'n', 'v' }, '<leader>p', function()
  require('conform').format()
end, { desc = 'Format (in range)' })

-- Lazygit
m.set('n', '<leader>hg', '<Cmd>LazyGit<CR>', { desc = 'Lazy[g]it' })

-- Lint
m.set('n', '<leader>ll', function()
  require('lint').try_lint()
end, { desc = 'Trigger linting for current file' })

-- Live server
m.set('n', '<leader>lo', '<Cmd>LiveServerStart<CR>', { desc = '[l]ive server [o]pen' })
m.set('n', '<leader>lc', '<Cmd>LiveServerStop<CR>', { desc = '[l]ive server [s]top' })
m.set('n', '<leader>lt', '<Cmd>LiveServerToggle<CR>', { desc = '[l]ive server [t]oggle' })

-- Tree
m.set('n', '<leader>ee', '<Cmd>NvimTreeToggle<CR>', { desc = '[e]xplorer toggle' })
m.set('n', '<leader>ef', '<Cmd>NvimTreeFindFileToggle<CR>', { desc = '[e]xplorer on current [f]ile' })
m.set('n', '<leader>ec', '<Cmd>NvimTreeCollapse<CR>', { desc = '[e]explorer [c]ollapse' })
m.set('n', '<leader>er', '<Cmd>NvimTreeRefresh<CR>', { desc = '[e]xplorer [r]efresh' })

-- Oil
m.set('n', '-', '<Cmd>Oil<CR>', { desc = 'Open parent directory' })

-- Telescope
m.set('n', '<leader>ff', '<Cmd>Telescope find_files<CR>', { desc = '[f]ind [f]iles' })
m.set('n', '<leader>fr', '<Cmd>Telescope oldfiles<CR>', { desc = '[f]ind [r]ecent' })
m.set('n', '<leader>fs', '<Cmd>Telescope live_grep<CR>', { desc = '[f]ind [s]tring in cwd' })
m.set('n', '<leader>fc', '<Cmd>Telescope grep_string<CR>', { desc = '[f]ind string under [c]ursor in cwd' })
m.set('n', '<leader>ft', '<Cmd>TodoTelescope<CR>', { desc = '[f]ind [t]odos' })

-- Trouble
m.set('n', '<leader>xw', '<Cmd>Trouble diagnostics toggle<CR>', { desc = 'Open trouble [w]orkspace diagnostics' })
m.set('n', '<leader>xd', '<Cmd>Trouble diagnostics toggle filter.buf=0<CR>', { desc = 'Open trouble [d]ocument diagnostics' })
m.set('n', '<leader>xq', '<Cmd>Trouble quickfix toggle<CR>', { desc = 'Open trouble [q]uickfix list' })
m.set('n', '<leader>xl', '<Cmd>Trouble loclist toggle<CR>', { desc = 'Open trouble [l]ocation list' })
m.set('n', '<leader>xt', '<Cmd>Trouble todo toggle<CR>', { desc = 'Open [t]odos in trouble' })

-- Vim-maximizer
m.set('n', '<leader>sm', '<Cmd>MaximizerToggle<CR>', { desc = '[s]plit to [m]ax/min' })
