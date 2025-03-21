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
      dashboard.button('e', '  > File explorer', ':NvimTreeToggle<Cr>'),
      dashboard.button('f', '󰱼  > Find File', ':Telescope find_files<Cr>'),
      dashboard.button('s', '  > Live Grep', ':Telescope live_grep<Cr>'),
      dashboard.button('k', '  > Find Keymaps', ':Telescope keymaps<Cr>'),
      dashboard.button('r', '󰁯  > Restore Session', ':SessionRestore<Cr>'),
      dashboard.button('q', '  > Quit NVIM', ':qa<Cr>'),
    }

    alpha.setup(dashboard.opts)

    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
