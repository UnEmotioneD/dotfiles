return {
  'nvim-treesitter/nvim-treesitter',
  event = { 'BufReadPre', 'BufNewFile' },
  build = ':TSUpdate',
  dependencies = {
    'windwp/nvim-ts-autotag',
  },
  require('nvim-treesitter.configs').setup {
    highlight = {
      enable = true,
    },
    indent = {
      enable = true, --[[disable = { "html" }]]
    },
    -- enable autotagging (w/ nvim-ts-autotag plugin)
    autotag = {
      enable = true,
    },
    ensure_installed = {
      'json',
      'javascript',
      'typescript',
      'tsx',
      'yaml',
      'html',
      'css',
      'prisma',
      'markdown',
      'markdown_inline',
      'svelte',
      'graphql',
      'bash',
      'lua',
      'vim',
      'dockerfile',
      'gitignore',
      'query',
      'vimdoc',
      'c',
      'python',
      'rust',
    },

    auto_install = true,

    -- if any parser fails to install, ignore it
    ignore_install = {},

    sync_install = false,
    modules = {},

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<C-space>',
        node_incremental = '<C-space>',
        node_decremental = '<bs>',
        scope_incremental = false,
      },
    },
  },
}
