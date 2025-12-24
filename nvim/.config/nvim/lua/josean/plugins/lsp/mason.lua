return {
  'mason-org/mason.nvim',
  dependencies = {
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    require('mason').setup()

    require('mason-lspconfig').setup({
      ensure_installed = {
        'typos_lsp',
        'lua_ls',
        'clangd',
        'pyright',
        'html',
        'cssls',
        'ts_ls',
        'emmet_ls',
        'marksman', -- markdown
        'taplo', -- toml
        'gopls',
      },
    })

    require('mason-tool-installer').setup({
      ensure_installed = {
        'stylua',
        'cpplint',
        'clang-format',
        'prettierd', -- faster prettier
        'pylint',
        'isort', -- python import sorter
        'black', -- python formatter
        'eslint_d',
        'markdownlint',
        'gofumpt',
        'golines',
        'goimports-reviser',
      },
    })
  end,
}
