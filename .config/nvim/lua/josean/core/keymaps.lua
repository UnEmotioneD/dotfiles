vim.g.mapleader = ' '

local map = vim.keymap -- for conciseness

---------------------
-- General Keymaps --
---------------------

-- Unbind keymaps to avoid collision with tmux keybinds
map.set('', '<C-n>', '<Nop>', { noremap = true, silent = true })
map.set('', '<C-p>', '<Nop>', { noremap = true, silent = true })

-- Center window when navigating through search
map.set('n', 'n', 'nzz')
map.set('n', 'N', 'Nzz')

-- Delete single character without copying into register
map.set('n', 'x', '"_x')

-- Yank to end of the line
map.set('n', 'Y', 'y$')

-- Window management
map.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' })
map.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' })
map.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' })
map.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' })

-- Tab navigation
map.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' })
map.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' })
map.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' })
map.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' })
map.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' })

-- write / quit
map.set('n', '<leader>ww', '<cmd>w<CR>', { desc = 'Write current file' })
map.set('n', '<leader>wa', '<cmd>wa<CR>', { desc = 'Write all files' })
map.set('n', '<leader>qq', '<cmd>q<CR>', { desc = 'Quite current buffer' })
map.set('n', '<leader>qa', '<cmd>qa<CR>', { desc = 'Quite all buffers' })
map.set('n', '<leader>wq', '<cmd>wqa<CR>', { desc = 'Write and quite all buffers' })

map.set('n', '<leader>dm', '<cmd>delm!<CR>', { desc = 'Delete all marks' })

map.set('n', '<leader>nh', '<cmd>nohl<CR>', { desc = 'Clear search highlights' })

---------------------
-- Plugin Keymaps --
---------------------

-- auto-session
map.set('n', '<leader>wr', '<cmd>SessionRestore<CR>', { desc = 'Restore session for cwd' }) -- restore last workspace session for current directory
map.set('n', '<leader>ws', '<cmd>SessionSave<CR>', { desc = 'Save session for auto session root dir' }) -- save workspace session for current working directory

-- chatGPT
map.set('n', '<leader>go', '<cmd>ChatGPT<CR>', { desc = 'Open normal ChatGPT' })
map.set('n', '<leader>ge', '<cmd>ChatGPTEditWithInstruction<CR>', { desc = 'Edit with instruction' })
map.set('n', '<leader>gg', '<cmd>ChatGPTRun grammar_correction<CR>', { desc = 'Correct grammer' })
map.set('n', '<leader>gf', '<cmd>ChatGPTRun fix_bugs<CR>', { desc = 'Fix bugs' })

-- Flash
map.set('n', '<leader>fl', function()
    require('flash').jump()
end, { desc = 'Flash' })

-- Formatting
map.set({ 'n', 'v' }, '<leader>fo', function()
    require('conform').format()
end, { desc = 'Format file or range (in visual mode)' })

-- Lazygit
map.set('n', '<leader>git', '<cmd>LazyGit<CR>', { desc = 'Open lazygit' })

-- Live server
map.set('n', '<leader>lo', '<cmd>LiveServerStart<CR>', { desc = 'Live server open' })
map.set('n', '<leader>lc', '<cmd>LiveServerStop<CR>', { desc = 'Live server stop' })
map.set('n', '<leader>lt', '<cmd>LiveServerToggle<CR>', { desc = 'Live server toggle' })

-- Markdown preview
map.set('n', '<leader>mp', '<cmd>MarkdownPreview<CR>', { desc = 'Preview markdown' })

-- Markdown render
map.set('n', '<leader>mr', function()
    require('render-markdown').toggle()
end, { desc = 'Render Markdown' })

-- nvim-tree
map.set('n', '<leader>ee', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
map.set('n', '<leader>ef', '<cmd>NvimTreeFindFileToggle<CR>', { desc = 'Toggle file explorer on current file' })
map.set('n', '<leader>ec', '<cmd>NvimTreeCollapse<CR>', { desc = 'Collapse file explorer' })
map.set('n', '<leader>er', '<cmd>NvimTreeRefresh<CR>', { desc = 'Refresh file explorer' })

-- Obsidian
map.set('n', '<leader>mo', '<cmd>ObsidianOpen<CR>', { desc = 'Open in Obsidian' })

-- Oil
map.set('n', '-', '<cmd>Oil<CR>', { desc = 'Open parent directory' })

-- todo-comments
map.set('n', '<leader>]t', function()
    require('todo-comments').jump_next()
end, { desc = 'Next todo comment' })

map.set('n', '<leader>[t', function()
    require('todo-comments').jump_prev()
end, { desc = 'previous todo comment' })

-- Treesitter
map.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', { desc = 'Fuzzy find files in cwd' })
map.set('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>', { desc = 'Fuzzy find recent files' })
map.set('n', '<leader>fs', '<cmd>Telescope live_grep<CR>', { desc = 'Find string in cwd' })
map.set('n', '<leader>fc', '<cmd>Telescope grep_string<CR>', { desc = 'Find string under cursor in cwd' })
map.set('n', '<leader>ft', '<cmd>TodoTelescope<CR>', { desc = 'Find todos' })

-- Trouble
map.set('n', '<leader>xw', '<cmd>Trouble diagnostics toggle<CR>', { desc = 'Open trouble workspace diagnostics' })
map.set('n', '<leader>xd', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', { desc = 'Open trouble document diagnostics' })
map.set('n', '<leader>xq', '<cmd>Trouble quickfix toggle<CR>', { desc = 'Open trouble quickfix list' })
map.set('n', '<leader>xl', '<cmd>Trouble loclist toggle<CR>', { desc = 'Open trouble location list' })
map.set('n', '<leader>xt', '<cmd>Trouble todo toggle<CR>', { desc = 'Open todos in trouble' })

-- vim-maximizer
map.set('n', '<leader>sm', '<cmd>MaximizerToggle<CR>', { desc = 'Maximize/minimize a split' })
