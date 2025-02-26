local o = vim.opt

o.relativenumber = true
o.number = true

o.startofline = true -- 'gg' to start of line

o.scrolloff = 10

local indent = 2
o.tabstop = indent -- Tab as 2 spaces
o.shiftwidth = indent -- Auto indent to 2 spaces
o.softtabstop = indent -- Tab and BS as 2 spaces
o.expandtab = true -- Use spaces instead of literal tab characters
o.autoindent = true -- Maintain indent of current line

o.ignorecase = true
o.smartcase = true

o.termguicolors = true
o.background = 'dark'
-- o.guicursor = '' -- block cursor only
o.cursorline = true
o.signcolumn = 'yes' -- prevents text shifting
o.wrap = false

o.backspace = 'indent,eol,start' -- More intuitive backspacing

o.clipboard:append('unnamedplus') -- Use the system clipboard

-- Split window placement
o.splitright = true
o.splitbelow = true

-- Performance and Timeout Settings
o.updatetime = 100
o.ttyfast = true
o.timeout = true
o.timeoutlen = 500 -- Wait 500ms for a mapping to complete
o.ttimeoutlen = 100 -- Wait 100ms for key code sequences (helps with escape delays)
o.lazyredraw = true

o.undofile = false
o.backup = false
o.writebackup = false
o.swapfile = false

o.spell = false
o.spelllang = { 'en', 'cjk' } -- Do not mark Chinese, Japanese, and Korean as errors
o.spellsuggest = 'best'

vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

-- Highlight on Yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('HighlightYank', {}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 300,
    })
  end,
})

-- No comment after commented line
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function()
    vim.opt_local.formatoptions:remove('r')
    vim.opt_local.formatoptions:remove('o')
  end,
})

-- Disable unused provider
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
