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
        'ts_ls',
        'html',
        'cssls',
        'tailwindcss',
        'svelte',
        'lua_ls',
        'graphql',
        'emmet_ls',
        'prismals',
        'pyright',
        'clangd',
      },
      automatic_installation = true,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- Lua
        'stylua', -- Lua formatter

        -- C/C++
        'clang-format', -- Formatter
        'cpplint', -- Linter

        -- Python
        'isort', -- Import organizer
        'black', -- Formatter
        'pylint', -- Linter
        'mypy',
        'ruff', -- Linter & formatter (written in rust)
        'debugpy',

        -- JavaScript
        'prettier', -- Formatter
        'eslint_d', -- Linter

        -- Rust
        'codelldb',
      },
    })
  end,
}
