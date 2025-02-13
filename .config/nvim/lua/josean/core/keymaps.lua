vim.g.mapleader = ' '

local m = vim.keymap

---------------------
-- General Keymaps --
---------------------

m.set('n', '<leader>nh', '<Cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

m.set('n', '<leader>dm', '<Cmd>delmarks!<CR>', { desc = 'Delete all marks' })

m.set('n', 'Y', 'y$', { desc = 'Yank to end of the line' })

-- Unbind keymaps to avoid collision with tmux keybinds
m.set('', '<C-n>', '<Nop>', { noremap = true, silent = true })
m.set('', '<C-p>', '<Nop>', { noremap = true, silent = true })

-- Center window when navigating through search
m.set('n', 'n', 'nzz')
m.set('n', 'N', 'Nzz')

-- Delete single character without copying into register
m.set('n', 'x', '"_x')

-- increment/decrement numbers
m.set('n', '<leader>+', '<C-a>', { desc = 'Increment number' })
m.set('n', '<leader>-', '<C-x>', { desc = 'Decrement number' })

-- Window management
m.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
m.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' })
m.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' })
m.set('n', '<leader>sx', '<Cmd>close<CR>', { desc = 'Close current split' })

-- Maximizer
m.set('n', '<leader>sm', '<Cmd>MaximizerToggle<CR>', { desc = 'Maximize/minimize a split' })

-- Tab navigation
m.set('n', '<leader>to', '<Cmd>tabnew<CR>', { desc = 'Open new tab' })
m.set('n', '<leader>tx', '<Cmd>tabclose<CR>', { desc = 'Close current tab' })
m.set('n', '<leader>tn', '<Cmd>tabn<CR>', { desc = 'Go to next tab' })
m.set('n', '<leader>tp', '<Cmd>tabp<CR>', { desc = 'Go to previous tab' })
m.set('n', '<leader>tf', '<Cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' })

-- write / quit
m.set('n', '<leader>ww', '<Cmd>w<CR>', { desc = 'Write current file changes' })
m.set('n', '<leader>wa', '<Cmd>wa<CR>', { desc = 'Write every changes' })
m.set('n', '<leader>qq', '<Cmd>q<CR>', { desc = 'Quit current buffer' })
m.set('n', '<leader>qa', '<Cmd>qa<CR>', { desc = 'Quit Nvim' })
m.set('n', '<leader>wq', '<Cmd>wqa<CR>', { desc = 'Write and quit Nvim' })

---------------------
-- Plugin Keymaps --
---------------------

-- Auto-session
m.set('n', '<leader>wr', '<Cmd>SessionRestore<CR>', { desc = 'Restore session for cwd' }) -- restore last workspace session for current directory
m.set('n', '<leader>ws', '<Cmd>SessionSave<CR>', { desc = 'Save session for auto session root dir' }) -- save workspace session for current working directory

-- Crates
m.set('n', '<leader>rcu', function()
  require('crates').upgrade_all_crates()
end, { desc = 'Update crates' })

-- ChatGPT
m.set('n', '<leader>go', '<Cmd>ChatGPT<CR>', { desc = '[o]pen normal ChatGPT' })
m.set('n', '<leader>ge', '<Cmd>ChatGPTEditWithInstruction<CR>', { desc = '[e]dit with instruction' })
m.set('n', '<leader>gg', '<Cmd>ChatGPTRun grammar_correction<CR>', { desc = 'Correct [g]rammer' })
m.set('n', '<leader>gf', '<Cmd>ChatGPTRun fix_bugs<CR>', { desc = '[f]ix bugs' })

-- Flash
m.set('n', '<leader>fl', function()
  require('flash').jump()
end, { desc = 'Flash' })

-- Conform
m.set({ 'n', 'v' }, '<leader>fm', function()
  require('conform').format()
end, { desc = 'Format file or range (in visual mode)' })

-- Lazygit
m.set('n', '<leader>lg', '<Cmd>LazyGit<CR>', { desc = 'Open lazygit' })

-- Lint
m.set('n', '<leader>ll', function()
  require('lint').try_lint()
end, { desc = 'Trigger linting for current file' })

-- Live server
m.set('n', '<leader>lo', '<Cmd>LiveServerStart<CR>', { desc = 'Live server open' })
m.set('n', '<leader>lc', '<Cmd>LiveServerStop<CR>', { desc = 'Live server stop' })
m.set('n', '<leader>lt', '<Cmd>LiveServerToggle<CR>', { desc = 'Live server toggle' })

-- Markdown preview
m.set('n', '<leader>mp', '<Cmd>MarkdownPreview<CR>', { desc = '[m]arkdown [p]erview' })

-- Markdown render
m.set('n', '<leader>mr', function()
  require('render-markdown').toggle()
end, { desc = '[m]arkdown [r]ender' })

-- Tree
m.set('n', '<leader>ee', '<Cmd>NvimTreeToggle<CR>', { desc = '[E]xplore toggle' })
m.set('n', '<leader>ef', '<Cmd>NvimTreeFindFileToggle<CR>', { desc = 'explorer on current [f]ile' })
m.set('n', '<leader>ec', '<Cmd>NvimTreeCollapse<CR>', { desc = '[e]xplore [c]ollapse' })
m.set('n', '<leader>er', '<Cmd>NvimTreeRefresh<CR>', { desc = '[e]xplore [r]efresh' })

-- Obsidian
m.set('n', '<leader>mo', '<Cmd>ObsidianOpen<CR>', { desc = '[m]arkdown in [o]bsidian' })

-- Oil
m.set('n', '-', '<Cmd>Oil<CR>', { desc = 'Open parent directory' })

-- Todo
m.set('n', '<leader>]t', function()
  require('todo-comments').jump_next()
end, { desc = 'Next todo comment' })

m.set('n', '<leader>[t', function()
  require('todo-comments').jump_prev()
end, { desc = 'Previous todo comment' })

-- Telescope
m.set('n', '<leader>ff', '<Cmd>Telescope find_files<CR>', { desc = 'Fuzzy find files in cwd' })
m.set('n', '<leader>fr', '<Cmd>Telescope oldfiles<CR>', { desc = 'Fuzzy find recent files' })
m.set('n', '<leader>fs', '<Cmd>Telescope live_grep<CR>', { desc = 'Find string in cwd' })
m.set('n', '<leader>fc', '<Cmd>Telescope grep_string<CR>', { desc = 'Find string under cursor in cwd' })
m.set('n', '<leader>ft', '<Cmd>TodoTelescope<CR>', { desc = 'Find todos' })

-- Trouble
m.set('n', '<leader>xw', '<Cmd>Trouble diagnostics toggle<CR>', { desc = 'Open trouble workspace diagnostics' })
m.set('n', '<leader>xd', '<Cmd>Trouble diagnostics toggle filter.buf=0<CR>', { desc = 'Open trouble document diagnostics' })
m.set('n', '<leader>xq', '<Cmd>Trouble quickfix toggle<CR>', { desc = 'Open trouble quickfix list' })
m.set('n', '<leader>xl', '<Cmd>Trouble loclist toggle<CR>', { desc = 'Open trouble location list' })
m.set('n', '<leader>xt', '<Cmd>Trouble todo toggle<CR>', { desc = 'Open todos in trouble' })
