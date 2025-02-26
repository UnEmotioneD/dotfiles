return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
  },
  opts = {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4,
    },
    settings = {
      save_on_toggle = true,
    },
  },
  keys = function()
    local keys = {
      {
        '<leader><leader>h',
        function()
          require('harpoon'):list():add()
        end,
        desc = '[h]arpoon File',
      },
      {
        '<leader><leader>e',
        function()
          local harpoon = require('harpoon')
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = 'Harpoon [e]dit',
      },
    }

    for i = 1, 4 do
      table.insert(keys, {
        '<leader><leader>' .. i,
        function()
          require('harpoon'):list():select(i)
        end,
        desc = 'Harpoon to ' .. i,
      })
    end
    return keys
  end,
}
