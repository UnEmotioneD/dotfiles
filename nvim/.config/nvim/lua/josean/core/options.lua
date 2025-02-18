--[[ 
  Netrw Configuration
  Sets the file explorer (netrw) list style.
]]
vim.cmd('let g:netrw_liststyle = 3')

-- for conciseness
local o = vim.opt

o.relativenumber = true
o.number = true

-- Ensure 'gg' moves the cursor to the start of the line.
o.startofline = true

o.scrolloff = 5

local indent = 2

o.tabstop = indent -- A tab is displayed as 2 spaces
o.shiftwidth = indent -- Indent by 2 spaces when auto-indenting
o.softtabstop = indent -- Editing: Tab/Backspace behaves as 2 spaces
o.expandtab = true -- Use spaces instead of literal tab characters
o.autoindent = true -- Maintain indent of current line when starting a new one

o.ignorecase = true
o.smartcase = true

o.termguicolors = true -- Enable true colors
o.background = 'dark'
o.cursorline = true
o.signcolumn = 'yes' -- prevents text shifting
o.wrap = false

o.backspace = 'indent,eol,start' -- More intuitive backspacing

o.clipboard:append('unnamedplus') -- Use the system clipboard

-- Split window placement
o.splitright = true
o.splitbelow = true

o.spell = false
o.spelllang = { 'en', 'cjk' } -- Do not mark Chinese, Japanese, and Korean as errors
o.spellsuggest = 'best' -- Use best suggestion for spelling corrections

o.swapfile = false -- Disable swap file creation

-- Performance and Timeout Settings
o.ttyfast = true -- Optimize for fast terminals
o.timeout = true -- Enable timeout for mapped sequences
o.timeoutlen = 500 -- Wait 500ms for a mapping to complete
o.ttimeoutlen = 100 -- Wait 100ms for key code sequences (helps with escape delays)
o.lazyredraw = false -- Redraw screen immediately (can help with macros)

vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

-- Highlight on Yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('HighlightYank', {}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 300, -- Highlight duration in milliseconds
    })
  end,
})

-- Do not comment the line after comment
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function()
    vim.opt_local.formatoptions:remove('r')
    vim.opt_local.formatoptions:remove('o')
  end,
})
