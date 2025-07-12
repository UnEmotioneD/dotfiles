return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('tokyonight').setup({
      style = 'storm',
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
      on_highlights = function(hl)
        local vague = '#5f607b'
        hl.Comment.fg = vague
        hl.DiagnosticUnnecessary.fg = vague
        hl.LineNrAbove.fg = vague
        hl.LineNrBelow.fg = vague
      end,
    })
    vim.cmd.colorscheme('tokyonight')
  end,
}
