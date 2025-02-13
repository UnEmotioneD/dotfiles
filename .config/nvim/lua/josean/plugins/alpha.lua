return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    -- https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=LAZYVIM
    dashboard.section.header.val = {
      '                                                                                                  ',
      '                                                                                                  ',
      '                                                                                                  ',
      '                                                                                                  ',
      '                                                                                                  ',
      '                                                                                                  ',
      '                                                                                                  ',
      '                                                                                                  ',
      '                                                                                                  ',
      '                                                                                                  ',
      '  ██╗   ██╗███╗   ██╗███████╗███╗   ███╗ ██████╗ ████████╗██╗ ██████╗ ███╗   ██╗███████╗██████╗   ',
      '  ██║   ██║████╗  ██║██╔════╝████╗ ████║██╔═══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝██╔══██╗  ',
      '  ██║   ██║██╔██╗ ██║█████╗  ██╔████╔██║██║   ██║   ██║   ██║██║   ██║██╔██╗ ██║█████╗  ██║  ██║  ',
      '  ██║   ██║██║╚██╗██║██╔══╝  ██║╚██╔╝██║██║   ██║   ██║   ██║██║   ██║██║╚██╗██║██╔══╝  ██║  ██║  ',
      '  ╚██████╔╝██║ ╚████║███████╗██║ ╚═╝ ██║╚██████╔╝   ██║   ██║╚██████╔╝██║ ╚████║███████╗██████╔╝  ',
      '   ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═╝     ╚═╝ ╚═════╝    ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═════╝   ',
    }

    dashboard.section.buttons.val = {
      dashboard.button('c', '  > Nvim Config', '<Cmd>cd ~/.config/nvim<CR>'),
      dashboard.button('SPC ee', '  > File explorer', '<Cmd>NvimTreeToggle<CR>'),
      dashboard.button('SPC ff', '󰱼  > Find File', '<Cmd>Telescope find_files<CR>'),
      dashboard.button('SPC fs', '  > Live Grep', '<Cmd>Telescope live_grep<CR>'),
      dashboard.button('SPC wr', '󰁯  > Restore Session', '<Cmd>SessionRestore<CR>'),
      dashboard.button('q', '  > Quit NVIM', '<Cmd>qa<CR>'),
    }

    alpha.setup(dashboard.opts)

    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
