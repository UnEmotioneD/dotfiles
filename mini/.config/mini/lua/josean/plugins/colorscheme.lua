return {
  'folke/tokyonight.nvim',
  priority = 1000,
  init = function()
    -- storm, moon, night, day
    vim.cmd.colorscheme('tokyonight-storm')
    vim.cmd.hi('Comment gui=none')
  end,
}
