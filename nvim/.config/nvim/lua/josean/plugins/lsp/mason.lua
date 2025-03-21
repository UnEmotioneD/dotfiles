return {
  'williamboman/mason.nvim',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  config = function()
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')
    local mason_tool_installer = require('mason-tool-installer')

    mason.setup({
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        'typos_lsp',
        'lua_ls',
        'html',
        'cssls',
        'ts_ls',
        'emmet_ls',
        'pyright',
        'clangd',
        'taplo', -- .toml LSP
      },
      automatic_installation = true,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        'stylua',
        'prettier',
        'eslint_d',
        'pylint',
        'isort',
        'black',
        'debugpy',
        'cpplint',
        'clang-format',
      },
    })
  end,
}
