vim.g.mapleader = ' '

local map = vim.keymap.set

---------------------
-- General Keymaps --
---------------------

--[[
n : Normal
i : Insert
v : Visual & Select
x : Visual only
s : Select only
o : Operator-pending
c : Command
t : Terminal
--]]

map('n', '<Esc>', ':nohl<CR>', { desc = 'Clear highlight search', silent = true })

map('n', ';', ':', { desc = 'Enter command mode w/ semi-colon' })

-- Center cursor when scrolling
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
-- Delete char without yanking
map('n', 'x', '"_x')
-- Yank to end of the line
map('n', 'Y', 'y$')
-- Paste over selection without overriding reg
map('v', 'p', 'pgvy')

map('n', '<leader>sv', '<C-w>v', { desc = '[s]plit [v]ertically' })
map('n', '<leader>sh', '<C-w>s', { desc = '[s]plit [h]orizontally' })
map('n', '<leader>se', '<C-w>=', { desc = '[s]plits into [e]qual size' })
map('n', '<leader>sx', ':close<CR>', { desc = '[s]plit [x] close' })

map('n', '<leader>to', ':tabnew<CR>', { desc = '[t]ab [o]pen new tab' })
map('n', '<leader>tf', ':tabnew %<CR>', { desc = '[t]ab [f]ile (open current buffer in new tab)' })
map('n', '<leader>tx', ':tabclose<CR>', { desc = '[t]ab [x] close current tab' })
map('n', '<leader>tn', ':tabn<CR>', { desc = '[t]ab [n]ext tab' })
map('n', '<leader>tp', ':tabp<CR>', { desc = '[t]ab [p]revious tab' })

map('n', '<leader>cs', ':setlocal spell! spell?<CR>', { desc = '[C]heck [S]pell toggle' })

-- Disable conflicting keybinds with tmux
map('', '<C-n>', '<Nop>', { noremap = true, silent = true })
map('', '<C-p>', '<Nop>', { noremap = true, silent = true })
-- Disable Ex Mode
map('n', 'Q', '<Nop>', { noremap = true, silent = true })
-- Open tmux sessionizer in a new tmux window
map('n', '<C-f>', ':silent !tmux neww tmux-sessionizer<CR>', { desc = 'Open tmux sessionizer' })

---------------------
-- Plugin Keymaps --
---------------------

-- Auto-session
map('n', '<leader>wr', ':SessionRestore<CR>', { desc = 'session [s]ave' })
map('n', '<leader>ws', ':SessionSave<CR>', { desc = 'session [r]estore' })

-- ChatGPT
map('n', '<leader>go', ':ChatGPT<CR>', { desc = '[g]pt [o]pen' })
map('n', '<leader>ge', ':ChatGPTEditWithInstruction<CR>', { desc = '[g]pt [e]dit with instruction' })
map('n', '<leader>gg', ':ChatGPTRun grammar_correction<CR>', { desc = '[g]pt Correct [g]rammer' })
map('n', '<leader>gf', ':ChatGPTRun fix_bugs<CR>', { desc = '[g]pt [f]ix bugs' })

-- Conform
map({ 'n', 'v' }, '<leader>p', function()
  require('conform').format()
end, { desc = 'Format(in range)' })
map('n', '<leader>ci', ':ConformInfo<CR>', { desc = '[C]onform [I]nfo' })

-- Flash
map('n', '<leader><leader>f', function()
  require('flash').jump()
end, { desc = '[f]lash' })

-- Gitsings
map('n', '<leader>hc', ':q1<CR>', { desc = 'Diff [c]lose' })

-- Haproon
local mod = '<M-'

-- TODO: Use command key for macOS
-- if vim.loop.os_uname().sysname == 'Darwin' then
--   mod = ''
-- end

map('n', mod .. 'u>', function()
  require('harpoon'):list():add()
end, { desc = '[h]arpoon File' })

map('n', mod .. 'i>', function()
  local harpoon = require('harpoon')
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Harpoon [e]dit' })

map('n', mod .. 'h>', function()
  require('harpoon'):list():select(1)
end, { desc = 'Harpoon to 1' })

map('n', mod .. 'j>', function()
  require('harpoon'):list():select(2)
end, { desc = 'Harpoon to 2' })

map('n', mod .. 'k>', function()
  require('harpoon'):list():select(3)
end, { desc = 'Harpoon to 3' })

map('n', mod .. 'l>', function()
  require('harpoon'):list():select(4)
end, { desc = 'Harpoon to 4' })

-- Hlslens
local function hlslens_key(key)
  return string.format("<Cmd>execute('normal! ' .. v:count1 .. '%szz')<CR><Cmd>lua require('hlslens').start()<CR>", key)
end

vim.keymap.set('n', 'n', hlslens_key('n'), { desc = 'Next hlsearch', noremap = true, silent = true })
vim.keymap.set('n', 'N', hlslens_key('N'), { desc = 'Prev hlsearch', noremap = true, silent = true })

-- Lazygit
map('n', '<leader>hg', ':LazyGit<CR>', { desc = 'Lazy[g]it' })

-- Live server
map('n', '<leader>lo', ':LiveServerStart<CR>', { desc = '[l]ive server [o]pen' })
map('n', '<leader>lc', ':LiveServerStop<CR>', { desc = '[l]ive server [c]lose' })
map('n', '<leader>lt', ':LiveServerToggle<CR>', { desc = '[l]ive server [t]oggle' })

-- Silicon
map('v', '<leader>ss', ':Silicon<CR>', { desc = '[S]ilicon [S]creenshot' })

-- Tree
map('n', '<leader>ee', ':NvimTreeToggle<CR>', { desc = '[e]xplorer toggle' })
map('n', '<leader>ef', ':NvimTreeFindFileToggle<CR>', { desc = '[e]xplorer on current [f]ile' })
map('n', '<leader>ec', ':NvimTreeCollapse<CR>', { desc = '[e]explorer [c]ollapse' })
map('n', '<leader>er', ':NvimTreeRefresh<CR>', { desc = '[e]xplorer [r]efresh' })

-- Todo-comments
map('n', ']t', function()
  require('todo-comments').jump_next()
end, { desc = 'Next todo comment' })

map('n', '[t', function()
  require('todo-comments').jump_prev()
end, { desc = 'Previous todo comment' })

-- Oil
map('n', '-', ':Oil<CR>', { desc = 'Open parent directory', silent = true })

-- Telescope
map('n', '<leader>ff', ':Telescope find_files<CR>', { desc = '[f]ind [f]iles' })
map('n', '<leader>fr', ':Telescope oldfiles<CR>', { desc = '[f]ind [r]ecent' })
map('n', '<leader>fs', ':Telescope live_grep<CR>', { desc = '[f]ind [s]tring in cwd' })
map('n', '<leader>fc', ':Telescope grep_string<CR>', { desc = '[f]ind string under [c]ursor in cwd' })
map('n', '<leader>ft', ':TodoTelescope<CR>', { desc = '[f]ind [t]odos' })
map('n', '<leader>fk', ':Telescope keymaps<CR>', { desc = '[f]ind [k]keymaps' })

-- Trouble
map('n', '<leader>xw', ':Trouble diagnostics toggle<CR>', { desc = 'Open trouble [w]orkspace diagnostics' })
map('n', '<leader>xd', ':Trouble diagnostics toggle filter.buf=0<CR>', { desc = 'Open trouble [d]ocument diagnostics' })
map('n', '<leader>xq', ':Trouble quickfix toggle<CR>', { desc = 'Open trouble [q]uickfix list' })
map('n', '<leader>xl', ':Trouble loclist toggle<CR>', { desc = 'Open trouble [l]ocation list' })
map('n', '<leader>xt', ':Trouble todo toggle<CR>', { desc = 'Open [t]odos in trouble' })

-- Vim-maximizer
map('n', '<leader>sm', ':MaximizerToggle<CR>', { desc = '[s]plit to [m]ax/min' })
