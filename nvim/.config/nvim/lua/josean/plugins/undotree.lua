return {
  'jiaoshijie/undotree',
  opts = {
    float_diff = true, -- `true` disables layout option
    layout = 'left_bottom', ---@type 'left_bottom' | 'left_left_bottom'
    position = 'left', ---@type 'left' | 'right' | 'bottom'
    ignore_filetype = {
      'TelescopePrompt',
      'qf',
      'spectre_panel',
      'tsplayground',
      'undotree',
      'undotreeDiff',
    },
    window = {
      winblend = 0,
    },
    keymaps = {
      ['j'] = 'move_next',
      ['k'] = 'move_prev',
      ['gj'] = 'move2parent',
      ['J'] = 'move_change_next',
      ['K'] = 'move_change_prev',
      ['<CR>'] = 'action_enter',
      ['p'] = 'enter_diffbuf',
      ['q'] = 'quit',
    },
  },
  keys = {
    {
      '<leader>u',
      function()
        require('undotree').toggle()
      end,
      desc = 'Undotree',
    },
  },
}
