return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    { 'antosha417/nvim-lsp-file-operations', config = true },
  },
  config = function()
    local cmp_nvim_lsp = require('cmp_nvim_lsp')
    local isText = true

    vim.diagnostic.config({
      virtual_text = isText,
      float = { border = 'single' },
    })

    local function toggle_inline_diagnostics()
      isText = not isText
      vim.diagnostic.config({
        virtual_text = isText,
      })
    end

    -- Centralized on_attach function for setting up buffer-local key mappings
    local on_attach = function(ev)
      local telescope = require('telescope.builtin')
      local opts = { buffer = ev.buf, silent = true }
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
        { mode = 'n', lhs = '<leader>tl', rhs = vim.diagnostic.open_float, desc = 'current line diagnostics' },
        { mode = 'n', lhs = '<leader>ti', rhs = toggle_inline_diagnostics, desc = 'inline-diagnostics' },
      }
      -- stylua: ignore end
      for _, map in ipairs(mappings) do
        vim.keymap.set(map.mode, map.lhs, map.rhs, vim.tbl_extend('force', opts, { desc = map.desc }))
      end
    end

    -- Enhance LSP capabilities for autocompletion
    local capabilities = vim.tbl_deep_extend('force', cmp_nvim_lsp.default_capabilities(), {
      textDocument = {
        completion = {
          editsNearCursor = true,
        },
      },
    })

    local lsp_config = vim.lsp.config
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
      filetypes = { 'html', 'css', 'javascriptreact' },
    })
  end,
}
