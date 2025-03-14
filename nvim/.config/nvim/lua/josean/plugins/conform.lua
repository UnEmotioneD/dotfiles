return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      html = { 'prettier' },
      css = { 'prettier' },
      javascript = { 'prettier' },
      javascriptreact = { 'prettier' },
      markdown = { 'prettier' },
      json = { 'prettier' },
      yaml = { 'prettier' },
      toml = { 'taplo' },
      python = { 'isort', 'black' },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 3000,
    },
    -- format_on_save = false,
  },
}
