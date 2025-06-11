vim.g.mapleader = ' '

local map = vim.keymap.set

map('v', 'p', '"_dP', { desc = 'Paste without overwriting register' })

map('n', 'C', 'c$', { desc = 'Change to EOL' })
map('n', 'Y', 'y$', { desc = 'Yank to EOL' })

map('n', 'x', '"_x', { desc = 'Delete char without yanking' })

map('n', 'H', ':bp<CR>', { desc = 'Previous buffer' })
map('n', 'L', ':bn<CR>', { desc = 'Next buffer' })

map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll half down and center' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll half up and center' })

-- stylua: ignore
map( 'n', 'J', ":let p=getpos('.')<BAR>join<BAR>call setpos('.', p)<CR>",
  { desc = 'Join lines (keep cursor position)', silent = true })

map('v', 'J', ":move '>+1<CR>gv=gv", { desc = 'Move line down and reindent', silent = true })
map('v', 'K', ":move '<-2<CR>gv=gv", { desc = 'Move line up and reindent', silent = true })

map('v', '<', '<gv', { desc = 'Outdent (keep selected)', silent = true })
map('v', '>', '>gv', { desc = 'Indent (keep selected)', silent = true })

map('n', '<Esc>', ':noh<CR>', { desc = 'Clear highlight', silent = true })

-- IM to English on Linux with fcitx5
if vim.uv.os_uname().sysname == 'Linux' then
  map('i', '<Esc>', function()
    vim.fn.system('fcitx5-remote -c')
    return '<Esc>'
  end, { expr = true })
end

map('n', '<leader>se', '<C-w>=', { desc = 'Equal size' })
map('n', '<leader>sh', '<C-w>s', { desc = 'Horizontally' })
map('n', '<leader>sv', '<C-w>v', { desc = 'Vertically' })
map('n', '<leader>sx', '<C-w>x', { desc = 'Swap side' })

map('n', '<leader>qn', ':cnext<CR>', { desc = 'Next qf item' })
map('n', '<leader>qp', ':cprev<CR>', { desc = 'Previous qf item' })

-- Disable Ex mode (old command interface)
map({ 'n', 'x' }, 'Q', '<Nop>')

-- Completely delete keymaps to hide it from telescoe.keymaps and which-key
vim.keymap.del('n', 'Q')
vim.keymap.del('x', 'Q')
