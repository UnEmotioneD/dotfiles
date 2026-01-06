return {
  'folke/tokyonight.nvim',
  dependencies = { 'vague-theme/vague.nvim' },
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

    require('vague').setup({
      bold = true,
      italic = true,
      style = {
        boolean = 'bold',
        error = 'bold',
        comments = 'italic',
        headings = 'bold',
        strings = 'italic',
        keyword_return = 'italic',
        builtin_constants = 'bold',
        builtin_types = 'bold',
      },
      plugins = {
        cmp = {
          match = 'bold',
          match_fuzzy = 'bold',
        },
        lsp = {
          diagnostic_error = 'bold',
          diagnostic_info = 'italic',
          diagnostic_warn = 'bold',
        },
        telescope = {
          match = 'bold',
        },
      },
    })

    vim.cmd.colorscheme('tokyonight')
  end,
}
