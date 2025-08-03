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
        'jdtls',
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
        'google-java-format',
        'prettierd', -- faster prettier
        'pylint',
        'isort', -- python import sorter
        'blue', -- python formatter
        'eslint_d',
        'markdownlint',
        'gofumpt',
        'golines',
        'goimports-reviser',
      },
    })
  end,
}
