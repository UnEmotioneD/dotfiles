return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'master',
  build = ':TSUpdate',
  dependencies = {
    'windwp/nvim-ts-autotag',
    { 'fladson/vim-kitty', ft = 'kitty', tag = 'v1.6' },
  },
  config = function()
    require('nvim-treesitter.configs').setup({
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
      },
      auto_install = true,
      indent = { enable = true },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
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
    })

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
