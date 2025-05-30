return {
  'stevearc/oil.nvim',
  lazy = false,
  opts = {
    skip_confirm_for_simple_edits = true,
    constrain_cursor = 'name',
    keymaps = {
      ['<C-h>'] = false,
      ['<C-l>'] = false,
      ['<leader>p'] = 'actions.preview',
    },
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        return name == '..' or name == '.git' or name == '.gitignore' or name == '.DS_Store'
      end,
    },
  },
  keys = {
    { '-', ':Oil<CR>', desc = 'Open parent directory', silent = true },
  },
}
