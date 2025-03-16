local tokyo = {
  'folke/tokyonight.nvim',
  priority = 1000,
  init = function()
    -- storm, moon, night, day
    vim.cmd.colorscheme('tokyonight-storm')
    vim.cmd.hi('Comment gui=none')

    -- Color for line numbers (from vscode catppuccin-mocha line number)
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#7f849c' })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#7F849C' })
  end,
}

local cat = {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      ---@type string | 'auto' | 'latte' | 'frappe' | 'macchiato' | 'mocha'
      flavour = 'mocha',
      transparent_background = false,
    })
    vim.cmd.colorscheme('catppuccin')
  end,
}

local os_name = vim.loop.os_uname().sysname

if os_name == 'Darwin' then
  return tokyo
else
  return cat
end
