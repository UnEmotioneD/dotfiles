return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    formatters_by_ft = {
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      javascriptreact = { 'prettier' },
      typescriptreact = { 'prettier' },
      svlte = { 'prettier' },
      css = { 'prettier' },
      -- html = { 'prettier' }, -- Prettier formats HTML into XHTML
      json = { 'prettier' },
      yaml = { 'prettier' },
      markdown = { 'prettier' },
      graphql = { 'prettier' },
      liquid = { 'prettier' },
      lua = { 'stylua' },
      python = { 'isort', 'black' },
      c = { 'clang-format' },
      toml = { 'taplo' },
      sh = { 'shfmt' },
    },
    format_on_save = {
      lsp_fallback = true,
      async = false,
      timeout_ms = 3000,
    },
    -- format_on_save = false,

    -- BUG: Cannot format .zshrc, .ideavimrc
    vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
      pattern = { '.bashrc', '.zshrc', 'config.fish', '.zshenv', '.ideavimrc', 'sketchybarrc' },
      command = 'set filetype=sh',
    }),
  },
}
