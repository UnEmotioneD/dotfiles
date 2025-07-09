return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'windwp/nvim-ts-autotag',
    { 'fladson/vim-kitty', ft = 'kitty', tag = 'v1.3' },
    { 'bezhermoso/tree-sitter-ghostty', build = 'make nvim_install' },
  },
  config = function()
    require('nvim-treesitter.configs').setup({
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        'bash',
        'c',
        'cpp',
        'css',
        'dockerfile',
        'git_config',
        'gitignore',
        'html',
        'hyprlang',
        'java',
        'javascript',
        'json',
        'jsonc',
        'latex',
        'lua',
        'markdown',
        'markdown_inline',
        'norg',
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
