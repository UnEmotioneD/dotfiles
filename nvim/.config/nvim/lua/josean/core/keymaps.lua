vim.g.mapleader = ' '

local m = vim.keymap

---------------------
-- General Keymaps --
---------------------

m.set('n', '<Esc>', ':nohl<CR>')

-- Center cursor when navigating search
m.set('n', 'n', 'nzz')
m.set('n', 'N', 'Nzz')

-- Center cursor when scrolling
m.set('n', '<C-d>', '<C-d>zz')
m.set('n', '<C-u>', '<C-u>zz')
-- Delete char without yanking
m.set('n', 'x', '"_x')
-- Cursor stays in place when joining lines
m.set('n', 'J', 'J<C-G>U')
-- Yank to end of the line
m.set('n', 'Y', 'y$')
-- Move selection up or down
m.set('v', 'J', ":m '>+1<CR>gv=gv")
m.set('v', 'K', ":m '<-2<CR>gv=gv")
-- Paste over selection without overriding reg
m.set('v', 'p', 'pgvy')

m.set('n', '<Leader>+', '<C-a>', { desc = 'Increase number by 1' })
m.set('n', '<Leader>-', '<C-x>', { desc = 'Decrease number by 1' })

m.set('n', '<Leader>sv', '<C-w>v', { desc = '[s]plit [v]ertically' })
m.set('n', '<Leader>sh', '<C-w>s', { desc = '[s]plit [h]orizontally' })
m.set('n', '<Leader>se', '<C-w>=', { desc = '[s]plits into [e]qual size' })
m.set('n', '<Leader>sx', ':close<CR>', { desc = '[s]plit [x] close' })
m.set('n', '<leader>sx', ':close<Cr>', { desc = '[s]plit [x] close' })

m.set('n', '<Leader>to', ':tabnew<CR>', { desc = '[t]ab [o]pen new tab' })
m.set('n', '<Leader>tf', ':tabnew %<CR>', { desc = '[t]ab [f]ile (open current buffer in new tab)' })
m.set('n', '<Leader>tx', ':tabclose<CR>', { desc = '[t]ab [x] close current tab' })
m.set('n', '<Leader>tn', ':tabn<CR>', { desc = '[t]ab [n]ext tab' })
m.set('n', '<Leader>tp', ':tabp<CR>', { desc = '[t]ab [p]revious tab' })

m.set('n', '<Leader>ww', ':w<CR>', { desc = 'Write current buffer' })
m.set('n', '<Leader>wa', ':wa<CR>', { desc = 'Write all buffers' })
m.set('n', '<Leader>wq', ':wqa<CR>', { desc = 'Write and quit Nvim' })
m.set('n', '<Leader>qq', ':Alpha<CR>', { desc = 'Quit current window' })
m.set('n', '<Leader>qa', ':qa<CR>', { desc = 'Quit Nvim' })

m.set('n', '<Leader>dm', ':delm!<CR>', { desc = 'Delete Marks' })

m.set('n', '<Leader>cs', ':setlocal spell! spell?<CR>', { desc = 'Check Spell' })

-- Disable conflicting keybinds with tmux
m.set('', '<C-n>', '<Nop>', { noremap = true, silent = true })
m.set('', '<C-p>', '<Nop>', { noremap = true, silent = true })
-- Disable Ex Mode
m.set('n', 'Q', '<Nop>', { noremap = true, silent = true })
-- Open tmux sessionizer in a new tmux window
m.set('n', '<C-f>', ':silent !tmux neww tmux-sessionizer<CR>', { desc = 'Open tmux sessionizer' })

---------------------
-- Plugin Keymaps --
---------------------

-- Auto-session
m.set('n', '<Leader>wr', ':SessionRestore<CR>', { desc = 'Restore session for cwd' })
m.set('n', '<Leader>ws', ':SessionSave<CR>', { desc = 'Save session for auto session root dir' })

-- ChatGPT
m.set('n', '<Leader>go', ':ChatGPT<CR>', { desc = '[g]pt [o]pen' })
m.set('n', '<Leader>ge', ':ChatGPTEditWithInstruction<CR>', { desc = '[g]pt [e]dit with instruction' })
m.set('n', '<Leader>gg', ':ChatGPTRun grammar_correction<CR>', { desc = '[g]pt Correct [g]rammer' })
m.set('n', '<Leader>gf', ':ChatGPTRun fix_bugs<CR>', { desc = '[g]pt [f]ix bugs' })

-- Flash
m.set('n', '<Leader><Leader>f', function()
  require('flash').jump()
end, { desc = '[f]lash' })

-- Conform
m.set({ 'n', 'v' }, '<Leader>p', function()
  require('conform').format()
end, { desc = 'Format(in range)' })

-- Lazygit
m.set('n', '<Leader>hg', ':LazyGit<CR>', { desc = 'Lazy[g]it' })

-- Lint
m.set('n', '<Leader>ll', function()
  require('lint').try_lint()
end, { desc = 'Trigger linting for current file' })

-- Live server
m.set('n', '<Leader>lo', ':LiveServerStart<CR>', { desc = '[l]ive server [o]pen' })
m.set('n', '<Leader>lc', ':LiveServerStop<CR>', { desc = '[l]ive server [s]top' })
m.set('n', '<Leader>lt', ':LiveServerToggle<CR>', { desc = '[l]ive server [t]oggle' })

-- Silicon
m.set('v', '<Leader>ss', ':Silicon<CR>', { desc = '[S]ilicon [S]creenshot' })

-- Tree
m.set('n', '<Leader>ee', ':NvimTreeToggle<CR>', { desc = '[e]xplorer toggle' })
m.set('n', '<Leader>ef', ':NvimTreeFindFileToggle<CR>', { desc = '[e]xplorer on current [f]ile' })
m.set('n', '<Leader>ec', ':NvimTreeCollapse<CR>', { desc = '[e]explorer [c]ollapse' })
m.set('n', '<Leader>er', ':NvimTreeRefresh<CR>', { desc = '[e]xplorer [r]efresh' })

-- Oil
m.set('n', '-', ':Oil<CR>', { desc = 'Open parent directory' })

-- Telescope
m.set('n', '<Leader>ff', ':Telescope find_files<CR>', { desc = '[f]ind [f]iles' })
m.set('n', '<Leader>fr', ':Telescope oldfiles<CR>', { desc = '[f]ind [r]ecent' })
m.set('n', '<Leader>fs', ':Telescope live_grep<CR>', { desc = '[f]ind [s]tring in cwd' })
m.set('n', '<Leader>fc', ':Telescope grep_string<CR>', { desc = '[f]ind string under [c]ursor in cwd' })
m.set('n', '<Leader>ft', ':TodoTelescope<CR>', { desc = '[f]ind [t]odos' })

-- Trouble
m.set('n', '<Leader>xw', ':Trouble diagnostics toggle<CR>', { desc = 'Open trouble [w]orkspace diagnostics' })
m.set('n', '<Leader>xd', ':Trouble diagnostics toggle filter.buf=0<CR>', { desc = 'Open trouble [d]ocument diagnostics' })
m.set('n', '<Leader>xq', ':Trouble quickfix toggle<CR>', { desc = 'Open trouble [q]uickfix list' })
m.set('n', '<Leader>xl', ':Trouble loclist toggle<CR>', { desc = 'Open trouble [l]ocation list' })
m.set('n', '<Leader>xt', ':Trouble todo toggle<CR>', { desc = 'Open [t]odos in trouble' })

-- Vim-maximizer
m.set('n', '<Leader>sm', ':MaximizerToggle<CR>', { desc = '[s]plit to [m]ax/min' })
