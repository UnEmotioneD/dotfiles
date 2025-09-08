return {
  'nvim-tree/nvim-tree.lua',
  init = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
  end,
  opts = {
    view = {
      side = 'left',
      relativenumber = true,
      width = 40,
    },
    renderer = {
      group_empty = true,
      indent_markers = {
        enable = true,
        inline_arrows = true,
      },
      icons = {
        glyphs = {
          folder = {
            arrow_closed = '',
            arrow_open = '',
          },
        },
      },
    },
    git = {
      enable = true,
    },
    filters = {
      enable = true,
      custom = {
        '.DS_Store',
        '^.git$',
        '.idea',
        -- Eclipse
        '.classpath',
        '.project',
        '.settings',
      },
    },
    update_focused_file = {
      enable = true,
      update_root = { enable = true },
    },
  },
  keys = {
    { '<leader>ee', ':NvimTreeToggle<CR>', desc = 'Toggle', silent = true },
    { '<leader>ec', ':NvimTreeCollapse<CR>', desc = 'Collapse', silent = true },
    { '<leader>er', ':NvimTreeRefresh<CR>', desc = 'Refresh' },
  },
}
