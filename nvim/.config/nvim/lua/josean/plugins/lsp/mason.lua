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
        'eslint', -- js, jsx
        'emmet_ls', -- html, css
        'marksman',
      },
    })

    require('mason-tool-installer').setup({
      ensure_installed = {
        'stylua',
        'cpplint',
        'clang-format',
        'google-java-format',
        'pylint',
        'isort',
        'black',
        'eslint_d',
        'prettierd',
        'markdownlint',
        'taplo', -- toml
      },
    })
  end,
}
