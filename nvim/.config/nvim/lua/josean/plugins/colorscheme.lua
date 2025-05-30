return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  dependencies = 'vague2k/vague.nvim',
  config = function()
    require('tokyonight').setup({
      style = 'storm',
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
      on_highlights = function(hl, c)
        local vague = '#5f607b'
        hl.Comment.fg = vague
        hl.DiagnosticUnnecessary.fg = vague
        hl.LineNrAbove.fg = vague
        hl.LineNrBelow.fg = vague

        local prompt = '#2d3149'
        hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
        hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
        hl.TelescopePromptNormal = { bg = prompt }
        hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
        hl.TelescopePromptTitle = { bg = prompt, fg = prompt }
        hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
        hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
      end,
    })

    require('vague').setup({
      style = {
        boolean = 'none',
        error = 'none',
        comments = 'none',
        headings = 'none',
        strings = 'none',

        keyword_return = 'none',

        builtin_constants = 'none',
        builtin_types = 'none',
      },
      plugins = {
        cmp = {
          match = 'none',
          match_fuzzy = 'none',
        },
        lsp = {
          diagnostic_info = 'none',
          diagnostic_warn = 'none',
          diagnostic_error = 'none',
        },
        telescope = {
          match = 'none',
        },
      },
    })

    vim.cmd.colorscheme('vague')
  end,
}
