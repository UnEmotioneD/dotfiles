local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.startofline = true -- 'gg' to start of line

opt.scrolloff = 5

local indent = 2
opt.tabstop = indent -- Tab as spaces
opt.shiftwidth = indent -- Auto indent to spaces
opt.softtabstop = indent -- Tab and BS as spaces
opt.expandtab = true -- Use spaces instead of literal tab characters
opt.autoindent = true -- Maintain indent of current line

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.background = 'dark'
-- o.guicursor = '' -- block cursor only
opt.cursorline = true
opt.signcolumn = 'yes' -- prevents text shifting
opt.wrap = false

opt.backspace = 'indent,eol,start' -- More intuitive backspacing

opt.clipboard:append('unnamedplus') -- Use the system clipboard

-- Split window placement
opt.splitright = true
opt.splitbelow = true

-- Performance and Timeout Settings
opt.updatetime = 100
opt.ttyfast = true
opt.timeout = true
opt.timeoutlen = 500 -- Wait 500ms for a mapping to complete
opt.ttimeoutlen = 100 -- Wait 100ms for key code sequences (helps with escape delays)
opt.lazyredraw = true

opt.undofile = false
opt.backup = false
opt.writebackup = false
opt.swapfile = false

opt.spell = false
opt.spelllang = { 'en', 'cjk' } -- Do not mark Chinese, Japanese, and Korean as errors
opt.spellsuggest = 'best'

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
