return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'arch',
        path = '~/Documents/Obsidian/archlinux/',
      },
      {
        name = 'resume',
        path = '~/Documents/Obsidian/resume/',
      },
    },
  },
}
