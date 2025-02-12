return {
    'stevearc/conform.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
        formatters_by_ft = {
            -- html = { 'prettier' }, -- Prettier formats HTML into XHTML
            css = { 'prettier' },
            javascript = { 'prettier' },
            typescript = { 'prettier' },
            javascriptreact = { 'prettier' },
            typescriptreact = { 'prettier' },
            json = { 'prettier' },
            yaml = { 'prettier' },
            markdown = { 'prettier' },
            lua = { 'stylua' },
            python = { 'isort', 'black' },
            c = { 'clang-format' },
            rust = { 'rustfmt' },
        },
        format_on_save = {
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
        },
        -- format_on_save = false,
    },
}
