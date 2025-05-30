return {
  'j-hui/fidget.nvim',
  opts = {
    progress = {
      suppress_on_insert = true,
      ignore_done_already = true,
      ignore_empty_message = true,
      display = {
        render_limit = 3,
        done_ttl = 1,
        done_icon = '',
      },
    },
    integration = {
      ['nvim-tree'] = {
        enable = true,
      },
    },
  },
}
