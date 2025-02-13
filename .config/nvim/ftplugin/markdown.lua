vim.b.slime_cell_delimiter = '```'

vim.wo.wrap = true
vim.wo.linebreak = true
vim.wo.breakindent = true
vim.wo.showbreak = '|'

vim.keymap.set('n', '<leader>mp', '<Cmd>MarkdownPreview<CR>', { desc = '[m]arkdown [p]erview' })

vim.keymap.set('n', '<leader>mr', function()
  require('render-markdown').toggle()
end, { desc = '[m]arkdown [r]ender' })

-- Obsidian
vim.keymap.set('n', '<leader>mo', '<Cmd>ObsidianOpen<CR>', { desc = '[m]arkdown in [o]bsidian' })
