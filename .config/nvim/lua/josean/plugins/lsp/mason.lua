return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
        local mason = require 'mason'
        local mason_lspconfig = require 'mason-lspconfig'
        local mason_tool_installer = require 'mason-tool-installer'

        mason.setup {
            ui = {
                icons = {
                    package_installed = '✓',
                    package_pending = '➜',
                    package_uninstalled = '✗',
                },
            },
        }

        mason_lspconfig.setup {
            ensure_installed = {
                'lua_ls',
                'emmet_ls',
                'ts_ls',
                'html',
                'cssls',
                'pyright',
                -- 'clangd',
                -- 'rust_analyzer',
            },
            -- To silence "Missing required fields" warnings
            automatic_installation = true,
        }

        mason_tool_installer.setup {
            ensure_installed = {
                'stylua',
                'eslint_d', -- js linter
                'prettier',
                'black', -- python formatter
                'isort', -- python import organizer
                'pylint', -- python linter
                -- 'clang-format',
                -- 'codelldb', -- rust debugger
                -- 'rustfmt', -- rust formatter
            },
        }
    end,
}
