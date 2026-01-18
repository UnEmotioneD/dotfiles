return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { 'antosha417/nvim-lsp-file-operations', config = true },
  },
  config = function()
    -- Centralized on_attach function for setting up buffer-local key mappings
    local on_attach = function(_, bufnr)
      local telescope = require('telescope.builtin')
      local opts = { buffer = bufnr, silent = true }
      -- stylua: ignore start
      local mappings = {
        { mode = 'n', lhs = 'K', rhs = function() vim.lsp.buf.hover({ border = 'single' }) end, desc = 'Documentation for Cursor' },

        { mode = 'n', lhs = 'gd', rhs = telescope.lsp_definitions, desc = 'LSP definitions' },
        { mode = 'n', lhs = 'gt', rhs = telescope.lsp_type_definitions, desc = 'LSP type definitions' },
        { mode = 'n', lhs = 'gD', rhs = vim.lsp.buf.declaration, desc = 'Go to Declaration' },

        { mode = 'n', lhs = '<leader>fs', rhs = telescope.lsp_document_symbols, desc = 'Buffer symbols' },
        { mode = 'n', lhs = '<leader>fS', rhs = telescope.lsp_workspace_symbols, desc = 'Workspace symbols' },
        { mode = 'n', lhs = '<leader>fi', rhs = telescope.lsp_incoming_calls, desc = 'Incoming calls' },
        { mode = 'n', lhs = '<leader>fo', rhs = telescope.lsp_outgoing_calls, desc = 'Outgoing calls' },

        { mode = 'n', lhs = '[d', rhs = function() vim.diagnostic.jump({ count = -1 }) end, desc = 'Prev diagnostic' },
        { mode = 'n', lhs = ']d', rhs = function() vim.diagnostic.jump({ count = 1 }) end, desc = 'Next diagnostic' },
      }
      -- stylua: ignore end
      for _, map in ipairs(mappings) do
        vim.keymap.set(map.mode, map.lhs, map.rhs, vim.tbl_extend('force', opts, { desc = map.desc }))
      end
    end

    local lsp_config = vim.lsp.config
    local default_capabilities = vim.lsp.protocol.make_client_capabilities()
    local capabilities = require('blink.cmp').get_lsp_capabilities(default_capabilities)

    lsp_config('typos_lsp', {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd_env = { RUST_LOG = 'error' },
      init_options = {
        config = vim.fn.expand('~/.config/nvim/typos/typos.toml'),
        diagnosticSeverity = 'Hint',
      },
    })
    lsp_config('lua_ls', {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
            disable = { 'missing-fields' },
          },
          completion = { callSnippet = 'Replace' },
        },
      },
    })
    lsp_config('emmet_ls', {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = {
        'html',
        'css',
        'javascript',
        'javascriptreact',
      },
    })
    lsp_config('eslint', {
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        vim.api.nvim_create_autocmd('BufWritePre', {
          buffer = bufnr,
          command = 'EslintFixAll',
        })
      end,
      capabilities = capabilities,
      filetypes = {
        'html',
        'javascript',
        'javascriptreact',
      },
    })
    lsp_config('ts_ls', {
      on_attach = function(client, bufnr)
        -- disable formatting
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        on_attach(client, bufnr)
      end,
      capabilities = capabilities,
      filetypes = {
        'javascript',
        'javascriptreact',
      },
    })
  end,
}
