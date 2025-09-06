return {
  'goolord/alpha-nvim',
  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    dashboard.section.header.val = {
      '                                                                                               ',
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

    dashboard.section.buttons.val = {
      dashboard.button('e', '  > Open Explorer', ':NvimTreeToggle<CR>'),
      dashboard.button('f', '󰱼  > Find File', ':Telescope find_files<CR>'),
      dashboard.button('w', '  > Find Word', ':Telescope live_grep<CR>'),
      dashboard.button('r', '󰁯  > Restore Session', ':AutoSession restore<CR>'),
      dashboard.button('g', '  > Open LazyGit', ':LazyGit<CR>'),
      dashboard.button('q', '  > Quit NVIM', ':qa<CR>'),
    }

    alpha.setup(dashboard.opts)

    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
