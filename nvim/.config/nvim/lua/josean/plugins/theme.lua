return {
  'folke/tokyonight.nvim',
  priority = 1000,
  init = function()
    vim.cmd.colorscheme('tokyonight-storm')
    vim.cmd.hi('Comment gui=none')

    -- Color for line numbers (from vscode catppuccin-mocha line number)
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#7f849c' })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#7F849C' })
  end,
}
