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
        'lua_ls',
        'html',
        'cssls',
        'ts_ls',
        'emmet_ls',
        'pyright',
        -- 'clangd',
        'typos_lsp',
        'taplo', -- .toml LSP
      },
      automatic_installation = true,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        'stylua',
        'prettier',
        'eslint_d',
        'isort',
        'black',
        'pylint',
        -- 'cpplint',
      },
    })
  end,
}
