return {
  'RRethy/vim-illuminate',
  config = function()
    require('illuminate').configure({
      -- providers: provider used to get references in the buffer, ordered by priority
      providers = {
        'lsp',
        'treesitter',
        'regex',
      },
      -- delay in ms
      delay = 200,
      filetypes_denylist = {
        'toml',
        'jsonc',
      },
      filetypes_allowlist = {
        'sh',
        'lua',
        'python',
        'c',
        'rust',
        'html',
        'css',
        'javascript',
        'javascriptreact',
      },
    })
  end,
}
