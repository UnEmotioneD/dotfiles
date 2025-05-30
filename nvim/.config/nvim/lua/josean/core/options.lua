local opt = vim.opt

opt.relativenumber = true
opt.number = true
opt.signcolumn = 'yes'
opt.wrap = false
opt.cursorline = true
opt.scrolloff = 6
opt.sidescrolloff = 6
opt.termguicolors = true
opt.background = 'dark'
opt.fillchars:append({ eob = ' ' })
opt.gcr = 'i:block-blinkwait0-blinkon500-blinkoff500'

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true
opt.startofline = true -- 'gg' to (0, 0)

opt.ignorecase = true
opt.smartcase = true

opt.backspace = { 'indent', 'eol', 'start' }
opt.clipboard:append('unnamedplus')

opt.splitright = true
opt.splitbelow = true

opt.updatetime = 50

opt.undofile = true
opt.undodir = vim.fn.stdpath('data') .. '/undo'
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- Disable Unused Providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
