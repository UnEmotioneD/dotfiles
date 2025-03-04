vim.g.mapleader = ' '

local m = vim.keymap

---------------------
-- General Keymaps --
---------------------

m.set('n', '<Esc>', ':nohl<Cr>', { desc = 'Clear highlight search', silent = true })

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
m.set('v', 'J', ":m '>+1<Cr>gv=gv")
m.set('v', 'K', ":m '<-2<Cr>gv=gv")
-- Paste over selection without overriding reg
m.set('v', 'p', 'pgvy')

m.set('n', '<leader>sv', '<C-w>v', { desc = '[s]plit [v]ertically' })
m.set('n', '<leader>sh', '<C-w>s', { desc = '[s]plit [h]orizontally' })
m.set('n', '<leader>se', '<C-w>=', { desc = '[s]plits into [e]qual size' })
m.set('n', '<leader>sx', ':close<Cr>', { desc = '[s]plit [x] close' })

m.set('n', '<leader>to', ':tabnew<Cr>', { desc = '[t]ab [o]pen new tab' })
m.set('n', '<leader>tf', ':tabnew %<Cr>', { desc = '[t]ab [f]ile (open current buffer in new tab)' })
m.set('n', '<leader>tx', ':tabclose<Cr>', { desc = '[t]ab [x] close current tab' })
m.set('n', '<leader>tn', ':tabn<Cr>', { desc = '[t]ab [n]ext tab' })
m.set('n', '<leader>tp', ':tabp<Cr>', { desc = '[t]ab [p]revious tab' })

m.set('n', '<leader>dm', ':delm!<Cr>', { desc = 'Delete Marks' })

m.set('n', '<leader>cs', ':setlocal spell! spell?<Cr>', { desc = '[C]heck [S]pell' })

-- Disable conflicting keybinds with tmux
m.set('', '<C-n>', '<Nop>', { noremap = true, silent = true })
m.set('', '<C-p>', '<Nop>', { noremap = true, silent = true })
-- Disable Ex Mode
m.set('n', 'Q', '<Nop>', { noremap = true, silent = true })
-- Open tmux sessionizer in a new tmux window
m.set('n', '<C-f>', ':silent !tmux neww tmux-sessionizer<Cr>', { desc = 'Open tmux sessionizer' })

---------------------
-- Plugin Keymaps --
---------------------

-- Auto-session
m.set('n', '<leader>wr', ':SessionRestore<Cr>', { desc = 'session [s]ave' })
m.set('n', '<leader>ws', ':SessionSave<Cr>', { desc = 'session [r]estore' })

-- ChatGPT
m.set('n', '<leader>go', ':ChatGPT<Cr>', { desc = '[g]pt [o]pen' })
m.set('n', '<leader>ge', ':ChatGPTEditWithInstruction<Cr>', { desc = '[g]pt [e]dit with instruction' })
m.set('n', '<leader>gg', ':ChatGPTRun grammar_correction<Cr>', { desc = '[g]pt Correct [g]rammer' })
m.set('n', '<leader>gf', ':ChatGPTRun fix_bugs<Cr>', { desc = '[g]pt [f]ix bugs' })

-- Conform
m.set({ 'n', 'v' }, '<leader>p', function()
  require('conform').format()
end, { desc = 'Format(in range)' })
m.set('n', '<leader>ci', ':ConformInfo<Cr>', { desc = '[C]onform [I]nfo' })

-- Flash
m.set('n', '<leader><leader>f', function()
  require('flash').jump()
end, { desc = '[f]lash' })

-- Gitsings
m.set('n', '<leader>hc', ':q1<Cr>', { desc = 'Diff [c]lose' })

-- Lazygit
m.set('n', '<leader>hg', ':LazyGit<Cr>', { desc = 'Lazy[g]it' })

-- Live server
m.set('n', '<leader>lo', ':LiveServerStart<Cr>', { desc = '[l]ive server [o]pen' })
m.set('n', '<leader>lc', ':LiveServerStop<Cr>', { desc = '[l]ive server [c]lose' })
m.set('n', '<leader>lt', ':LiveServerToggle<Cr>', { desc = '[l]ive server [t]oggle' })

-- Silicon
m.set('v', '<leader>ss', ':Silicon<Cr>', { desc = '[S]ilicon [S]creenshot' })

-- Tree
m.set('n', '<leader>ee', ':NvimTreeToggle<Cr>', { desc = '[e]xplorer toggle' })
m.set('n', '<leader>ef', ':NvimTreeFindFileToggle<Cr>', { desc = '[e]xplorer on current [f]ile' })
m.set('n', '<leader>ec', ':NvimTreeCollapse<Cr>', { desc = '[e]explorer [c]ollapse' })
m.set('n', '<leader>er', ':NvimTreeRefresh<Cr>', { desc = '[e]xplorer [r]efresh' })

-- Oil
m.set('n', '-', ':Oil<Cr>', { desc = 'Open parent directory', silent = true })

-- Telescope
m.set('n', '<leader>ff', ':Telescope find_files<Cr>', { desc = '[f]ind [f]iles' })
m.set('n', '<leader>fr', ':Telescope oldfiles<Cr>', { desc = '[f]ind [r]ecent' })
m.set('n', '<leader>fs', ':Telescope live_grep<Cr>', { desc = '[f]ind [s]tring in cwd' })
m.set('n', '<leader>fc', ':Telescope grep_string<Cr>', { desc = '[f]ind string under [c]ursor in cwd' })
m.set('n', '<leader>ft', ':TodoTelescope<Cr>', { desc = '[f]ind [t]odos' })
m.set('n', '<leader>fk', ':Telescope keymaps<Cr>', { desc = '[f]ind [k]keymaps' })

-- Trouble
m.set('n', '<leader>xw', ':Trouble diagnostics toggle<Cr>', { desc = 'Open trouble [w]orkspace diagnostics' })
m.set('n', '<leader>xd', ':Trouble diagnostics toggle filter.buf=0<Cr>', { desc = 'Open trouble [d]ocument diagnostics' })
m.set('n', '<leader>xq', ':Trouble quickfix toggle<Cr>', { desc = 'Open trouble [q]uickfix list' })
m.set('n', '<leader>xl', ':Trouble loclist toggle<Cr>', { desc = 'Open trouble [l]ocation list' })
m.set('n', '<leader>xt', ':Trouble todo toggle<Cr>', { desc = 'Open [t]odos in trouble' })

-- Vim-maximizer
m.set('n', '<leader>sm', ':MaximizerToggle<Cr>', { desc = '[s]plit to [m]ax/min' })
