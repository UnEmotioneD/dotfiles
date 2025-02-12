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
map.set('n', '<leader>sx', '<Cmd>close<CR>', { desc = 'Close current split' })

-- vim-maximizer
map.set('n', '<leader>sm', '<Cmd>MaximizerToggle<CR>', { desc = 'Maximize/minimize a split' })

-- Tab navigation
map.set('n', '<leader>to', '<Cmd>tabnew<CR>', { desc = 'Open new tab' })
map.set('n', '<leader>tx', '<Cmd>tabclose<CR>', { desc = 'Close current tab' })
map.set('n', '<leader>tn', '<Cmd>tabn<CR>', { desc = 'Go to next tab' })
map.set('n', '<leader>tp', '<Cmd>tabp<CR>', { desc = 'Go to previous tab' })
map.set('n', '<leader>tf', '<Cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' })

-- write / quit
map.set('n', '<leader>ww', '<Cmd>w<CR>', { desc = 'Write current file changes' })
map.set('n', '<leader>wa', '<Cmd>wa<CR>', { desc = 'Write every changes' })
map.set('n', '<leader>qq', '<Cmd>q<CR>', { desc = 'Quit current buffer' })
map.set('n', '<leader>qa', '<Cmd>qa<CR>', { desc = 'Quit Nvim' })
map.set('n', '<leader>wq', '<Cmd>wqa<CR>', { desc = 'Write and quit Nvim' })

map.set('n', '<leader>dm', '<Cmd>delm!<CR>', { desc = 'Delete all marks' })

map.set('n', '<leader>nh', '<Cmd>nohl<CR>', { desc = 'Clear highlighted search' })

---------------------
-- Plugin Keymaps --
---------------------

-- auto-session
map.set('n', '<leader>wr', '<Cmd>SessionRestore<CR>', { desc = 'Restore session for cwd' }) -- restore last workspace session for current directory
map.set('n', '<leader>ws', '<Cmd>SessionSave<CR>', { desc = 'Save session for auto session root dir' }) -- save workspace session for current working directory

-- chatGPT
map.set('n', '<leader>go', '<Cmd>ChatGPT<CR>', { desc = 'Open normal ChatGPT' })
map.set('n', '<leader>ge', '<Cmd>ChatGPTEditWithInstruction<CR>', { desc = 'Edit with instruction' })
map.set('n', '<leader>gg', '<Cmd>ChatGPTRun grammar_correction<CR>', { desc = 'Correct grammer' })
map.set('n', '<leader>gf', '<Cmd>ChatGPTRun fix_bugs<CR>', { desc = 'Fix bugs' })

-- Flash
map.set('n', '<leader>fl', function()
    require('flash').jump()
end, { desc = 'Flash' })

-- Formatting
map.set({ 'n', 'v' }, '<leader>fo', function()
    require('conform').format()
end, { desc = 'Format file or range (in visual mode)' })

-- Lazygit
map.set('n', '<leader>git', '<Cmd>LazyGit<CR>', { desc = 'Open lazygit' })

-- Lint
map.set('n', '<leader>l', function()
    require('lint').try_lint()
end, { desc = 'Trigger linting for current file' })

-- Live server
map.set('n', '<leader>lo', '<Cmd>LiveServerStart<CR>', { desc = 'Live server open' })
map.set('n', '<leader>lc', '<Cmd>LiveServerStop<CR>', { desc = 'Live server stop' })
map.set('n', '<leader>lt', '<Cmd>LiveServerToggle<CR>', { desc = 'Live server toggle' })

-- Markdown preview
map.set('n', '<leader>mp', '<Cmd>MarkdownPreview<CR>', { desc = '[M]arkdown [P]erview' })

-- Markdown render
map.set('n', '<leader>mr', function()
    require('render-markdown').toggle()
end, { desc = '[M]arkdown [R]ender' })

-- nvim-tree
map.set('n', '<leader>ee', '<Cmd>NvimTreeToggle<CR>', { desc = 'Toggle file explorer' })
map.set('n', '<leader>ef', '<Cmd>NvimTreeFindFileToggle<CR>', { desc = 'Toggle file explorer on current file' })
map.set('n', '<leader>ec', '<Cmd>NvimTreeCollapse<CR>', { desc = 'Collapse file explorer' })
map.set('n', '<leader>er', '<Cmd>NvimTreeRefresh<CR>', { desc = 'Refresh file explorer' })

-- nvim-dap
map.set('n', '<Leader>dl', "<cmd>lua require'dap'.step_into()<CR>", { desc = 'Debugger step into' })
map.set('n', '<Leader>dj', "<cmd>lua require'dap'.step_over()<CR>", { desc = 'Debugger step over' })
map.set('n', '<Leader>dk', "<cmd>lua require'dap'.step_out()<CR>", { desc = 'Debugger step out' })
map.set('n', '<Leader>dc', "<cmd>lua require'dap'.continue()<CR>", { desc = 'Debugger continue' })
map.set('n', '<Leader>db', "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = 'Debugger toggle breakpoint' })
map.set(
    'n',
    '<Leader>dd',
    "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
    { desc = 'Debugger set conditional breakpoint' }
)
map.set('n', '<Leader>de', "<cmd>lua require'dap'.terminate()<CR>", { desc = 'Debugger reset' })
map.set('n', '<Leader>dr', "<cmd>lua require'dap'.run_last()<CR>", { desc = 'Debugger run last' })

-- Obsidian
map.set('n', '<leader>mo', '<Cmd>ObsidianOpen<CR>', { desc = 'Open in [O]bsidian' })

-- Oil
map.set('n', '-', '<Cmd>Oil<CR>', { desc = 'Open parent directory' })

-- todo-comments
map.set('n', '<leader>]t', function()
    require('todo-comments').jump_next()
end, { desc = 'Next todo comment' })

map.set('n', '<leader>[t', function()
    require('todo-comments').jump_prev()
end, { desc = 'previous todo comment' })

-- Treesitter
map.set('n', '<leader>ff', '<Cmd>Telescope find_files<CR>', { desc = 'Fuzzy find files in cwd' })
map.set('n', '<leader>fr', '<Cmd>Telescope oldfiles<CR>', { desc = 'Fuzzy find recent files' })
map.set('n', '<leader>fs', '<Cmd>Telescope live_grep<CR>', { desc = 'Find string in cwd' })
map.set('n', '<leader>fc', '<Cmd>Telescope grep_string<CR>', { desc = 'Find string under cursor in cwd' })
map.set('n', '<leader>ft', '<Cmd>TodoTelescope<CR>', { desc = 'Find todos' })

-- Trouble
map.set('n', '<leader>xw', '<Cmd>Trouble diagnostics toggle<CR>', { desc = 'Open trouble workspace diagnostics' })
map.set('n', '<leader>xd', '<Cmd>Trouble diagnostics toggle filter.buf=0<CR>', { desc = 'Open trouble document diagnostics' })
map.set('n', '<leader>xq', '<Cmd>Trouble quickfix toggle<CR>', { desc = 'Open trouble quickfix list' })
map.set('n', '<leader>xl', '<Cmd>Trouble loclist toggle<CR>', { desc = 'Open trouble location list' })
map.set('n', '<leader>xt', '<Cmd>Trouble todo toggle<CR>', { desc = 'Open todos in trouble' })
