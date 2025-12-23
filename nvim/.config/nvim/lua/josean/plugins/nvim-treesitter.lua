return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'windwp/nvim-ts-autotag',
    { 'fladson/vim-kitty', ft = 'kitty', tag = 'v1.6' },
  },
  config = function()
    require('nvim-treesitter').setup({
      highlight = { enable = true },
      indent = { enable = true },
      install_dir = vim.fn.stdpath('data') .. '/site', -- set runtimepath
      ensure_installed = {
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
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-Space>',
          node_incremental = '<C-Space>',
          scope_incremental = false,
          node_decremental = '<BS>',
        },
      },
      vim.filetype.add({
        pattern = {
          ['.*/hypr/.*%.conf'] = 'hyprlang',
        },
      }),
    })

    require('nvim-ts-autotag').setup({
      opts = {
        enable_close_on_slash = true,
      },
    })
  end,
}
