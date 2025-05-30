return {
  'ThePrimeagen/harpoon',
  event = 'VeryLazy',
  branch = 'harpoon2',
  config = function()
    local harpoon = require('harpoon')
    local list = harpoon:list()
    local map = vim.keymap.set

    harpoon.setup({
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    })

    map('n', '<BS><leader>', function()
      list:add()
    end, { desc = '[h]arpoon file' })
    map('n', '<BS><BS>', function()
      harpoon.ui:toggle_quick_menu(list)
    end, { desc = 'Harpoon Edit' })

    map('n', '<BS>j', function()
      list:select(1)
    end, { desc = 'Harpoon to 1' })
    map('n', '<BS>k', function()
      list:select(2)
    end, { desc = 'Harpoon to 2' })
    map('n', '<BS>l', function()
      list:select(3)
    end, { desc = 'Harpoon to 3' })
    map('n', '<BS>;', function()
      list:select(4)
    end, { desc = 'Harpoon to 4' })

    map('n', '<C-n>', function()
      list:next()
    end, { desc = 'Next on harpoon list', noremap = true })
    map('n', '<C-p>', function()
      list:prev()
    end, { desc = 'Prev on harpoon list', noremap = true })

    harpoon:extend({
      UI_CREATE = function(cx)
        map('n', '<C-h>', function()
          harpoon.ui:select_menu_item({ split = true })
        end, { buffer = cx.bufnr })

        map('n', '<C-v>', function()
          harpoon.ui:select_menu_item({ vsplit = true })
        end, { buffer = cx.bufnr })

        map('n', '<C-t>', function()
          harpoon.ui:select_menu_item({ tabedit = true })
        end, { buffer = cx.bufnr })
      end,
    })

    harpoon:extend(require('harpoon.extensions').builtins.highlight_current_file())
  end,
}
