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
      dashboard.button('e', '  > New File', '<cmd>ene<CR>'),
      dashboard.button('SPC ee', '  > File explorer', '<cmd>NvimTreeToggle<CR>'),
      dashboard.button('SPC ff', '󰱼  > Find File', '<cmd>Telescope find_files<CR>'),
      dashboard.button('SPC fs', '  > Live Grep', '<cmd>Telescope live_grep<CR>'),
      dashboard.button('SPC wr', '󰁯  > Restore Session', '<cmd>SessionRestore<CR>'),
      dashboard.button('q', '  > Quit NVIM', '<cmd>qa<CR>'),
    }

    alpha.setup(dashboard.opts)

    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
