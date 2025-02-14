vim.cmd('let g:netrw_liststyle = 3')

local o = vim.opt -- for conciseness

-- line numbers
o.relativenumber = true -- show relative line numbers
o.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
local indent = 2

o.tabstop = indent -- prettier default == 2
o.shiftwidth = indent
o.softtabstop = indent -- Tab, backspace behaves as much as indent width
o.expandtab = true -- expand tab to spaces
o.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
o.wrap = false

-- search settings
o.ignorecase = true -- ignore case when searching
o.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
o.cursorline = true -- highlight the current cursor line

-- appearance
o.termguicolors = true
o.background = 'dark' -- colorschemes that can be light or dark will be made dark
o.signcolumn = 'yes' -- show sign column so that text doesn't shift

-- backspace
o.backspace = 'indent,eol,start' -- allow backspace on indent, end of line or insert mode start position

-- clipboard
o.clipboard:append('unnamedplus') -- use system clipboard as default register

-- split windows
o.splitright = true -- split vertical window to the right
o.splitbelow = true -- split horizontal window to the bottom

-- spelling
o.spell = false
o.spelllang = { 'en', 'cjk' } -- Do not mark Chinese, Japanese and Korean as error
o.spellsuggest = 'best'

-- turn off swapfile
o.swapfile = false

-- 'gg' goes to start of first line
o.startofline = true

o.scrolloff = 5

-- Highlight on Yank
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('HighlightYank', {}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 200, -- Duration in milliseconds
    })
  end,
})
