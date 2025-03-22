return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    -- https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=LAZYVIM
    local header = {
      '                                                                                               ',
      '                                                                                               ',
      '                                                                                               ',
      '                                                                                               ',
      '                                                                                               ',
      '                                                                                               ',
      '                                                                                               ',
      ' ██╗   ██╗███╗   ██╗███████╗███╗   ███╗ ██████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗██████╗ ',
      ' ██║   ██║████╗  ██║██╔════╝████╗ ████║██╔═══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝██╔══██╗',
      ' ██║   ██║██╔██╗ ██║█████╗  ██╔████╔██║██║   ██║   ██║   ██║██║   ██║██╔██╗ ██║█████╗  ██║  ██║',
      ' ██║   ██║██║╚██╗██║██╔══╝  ██║╚██╔╝██║██║   ██║   ██║   ██║██║   ██║██║╚██╗██║██╔══╝  ██║  ██║',
      ' ╚██████╔╝██║ ╚████║███████╗██║ ╚═╝ ██║╚██████╔╝   ██║   ██║╚██████╔╝██║ ╚████║███████╗██████╔╝',
      '  ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═╝     ╚═╝ ╚═════╝    ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═════╝ ',
      '                                                                                               ',
    }

    dashboard.section.header.val = header

    dashboard.section.buttons.val = {
      dashboard.button('e', '  > File explorer', ':NvimTreeToggle<CR>'),
      dashboard.button('f', '󰱼  > Find File', ':Telescope find_files<CR>'),
      dashboard.button('s', '  > Live Grep', ':Telescope live_grep<CR>'),
      dashboard.button('k', '  > Find Keymaps', ':Telescope keymaps<CR>'),
      dashboard.button('r', '󰁯  > Restore Session', ':SessionRestore<CR>'),
      dashboard.button('q', '  > Quit NVIM', ':qa<CR>'),
    }

    alpha.setup(dashboard.opts)

    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
