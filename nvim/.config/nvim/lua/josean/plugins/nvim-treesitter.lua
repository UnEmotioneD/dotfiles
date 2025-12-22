return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'windwp/nvim-ts-autotag',
    { 'fladson/vim-kitty', ft = 'kitty', tag = 'v1.6' },
  },
  config = function()
    local treesitter = require('nvim-treesitter')

    treesitter.setup({
      opts = {
        install_dir = vim.fn.stdpath('data') .. '/site', -- set runtimepath
      },
    })

    treesitter
      .install({
        'bash',
        'c',
        'cpp',
        'css',
        'git_config',
        'gitignore',
        'html',
        'hyprlang',
        'javascript',
        'json',
        'jsonc',
        'jsx',
        'lua',
        'markdown',
        'markdown_inline',
        'python',
        'query',
        'regex',
        'tmux',
        'toml',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'yaml',
        'go',
        'gomod', -- declares module and its dependencies
        'gosum', -- dependency integrity checksum
        'gotmpl',
        'gowork', -- workspace for multiple modules
      })
      :wait(60000) -- 1 min

    vim.filetype.add({
      pattern = {
        ['.*/hypr/.*%.conf'] = 'hyprlang',
      },
    })

    require('nvim-ts-autotag').setup({
      opts = {
        enable_close_on_slash = true,
      },
    })
  end,
}
