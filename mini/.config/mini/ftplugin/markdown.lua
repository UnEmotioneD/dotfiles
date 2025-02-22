local opt = vim.opt_local
local m = vim.keymap.set

-- Enable word wrap and break lines at word boundaries
opt.wrap = true
opt.linebreak = true

-- Set a comfortable text width for automatic formatting (adjust as needed)
opt.textwidth = 80
opt.formatoptions:append('t') -- Automatically wrap text using textwidth

-- Indentation settings for lists and nested elements
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true

-- Optional: Configure folding based on Markdown headers
-- This simple expression folds sections starting at Markdown headers (e.g., "#", "##", etc.)
opt.foldmethod = 'expr'
opt.foldexpr = "getline(v:lnum)=~'^\\s*#' ? '>' . (strlen(submatch(0)) - 1) : '='"

m('n', 'j', 'gj')
m('n', 'k', 'gk')
m('n', '<Down>', 'gj')
m('n', '<Up>', 'gk')

-- Keymaps for render, preview and open in obsidian
m('n', '<leader>mp', '<Cmd>MarkdownPreview<CR>', { desc = '[m]arkdown [p]erview' })

m('n', '<leader>mr', function()
  require('render-markdown').toggle()
end, { desc = '[m]arkdown [r]ender' })

-- Obsidian
m('n', '<leader>mo', '<Cmd>ObsidianOpen<CR>', { desc = '[m]arkdown in [o]bsidian' })
