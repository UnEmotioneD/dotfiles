return {
  'stevearc/conform.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local conform = require('conform')

    conform.setup({
      formatters_by_ft = {
        lua = { 'stylua' },
        -- c = { 'clang-format' },
        -- cpp = { 'clang-format' },
        -- java = { 'google-java-format' },
        python = { 'isort', 'blue' },
        html = { 'prettierd' },
        css = { 'prettierd' },
        javascript = { 'prettierd' },
        typescript = { 'prettierd' },
        javascriptreact = { 'prettierd' },
        typescriptreact = { 'prettierd' },
        markdown = { 'prettierd' },
        json = { 'prettierd' },
        jsonc = { 'prettierd' },
        yaml = { 'prettierd' },
        toml = { 'taplo' },
      },
      default_format_opts = {
        timeout_ms = 3000,
        async = false,
        quiet = false,
        lsp_format = 'fallback',
      },
      format_on_save = {
        timeout_ms = 3000,
        async = false,
        quiet = false,
        lsp_format = 'fallback',
      },
    })

    vim.keymap.set({ 'n', 'v' }, '<leader>p', function()
      conform.format()
    end, { desc = 'Format' })

    vim.keymap.set('n', '<leader>cc', function()
      vim.fn.system('rm ~/.local/state/nvim/conform.log')
    end, { desc = 'Clear log' })

    vim.keymap.set('n', '<leader>ci', ':ConformInfo<CR>', { desc = 'Show info' })
  end,
}
