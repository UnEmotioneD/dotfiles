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
      is_always_hidden = function(file, _)
        return vim.tbl_contains({
          '..',
          '.DS_Store',
          '.git',
          '.idea',
          -- Eclipse
          '.classpath',
          '.project',
          '.settings',
        }, file)
      end,
    },
  },
  keys = {
    { '-', ':Oil<CR>', desc = 'Open parent directory', silent = true },
  },
}
