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
      dashboard.button('e', '  > New File', '<cmd>ene<CR>'), -- After creating new file <Cmd>w {file-name}<Cr> to name it
      dashboard.button('SPC ee', '  > File explorer', '<Cmd>NvimTreeToggle<CR>'),
      dashboard.button('SPC ff', '󰱼  > Find File', '<Cmd>Telescope find_files<CR>'),
      dashboard.button('SPC fs', '  > Live Grep', '<Cmd>Telescope live_grep<CR>'),
      dashboard.button('SPC wr', '󰁯  > Restore Session', '<Cmd>SessionRestore<CR>'), -- Restore session for CWD
      dashboard.button('q', '  > Quit NVIM', '<Cmd>qa<CR>'),
    }

    alpha.setup(dashboard.opts)

    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
