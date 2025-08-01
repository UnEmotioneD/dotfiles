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
      local opts = { buffer = ev.buf, silent = true }
      local mappings = {
        -- stylua: ignore start
        { mode = 'n', lhs = 'K', rhs = function() vim.lsp.buf.hover({ border = 'single' }) end, desc = 'Documentation for Cursor' },

        { mode = 'n', lhs = 'gt', rhs = ':Telescope lsp_type_definitions<CR>', desc = 'LSP type definitions' },
        { mode = 'n', lhs = 'gd', rhs = ':Telescope lsp_definitions<CR>', desc = 'LSP definitions' },
        { mode = 'n', lhs = 'gD', rhs = vim.lsp.buf.declaration, desc = 'Go to Declaration' },

        { mode = 'n', lhs = '<leader>fs', rhs = ':Telescope lsp_document_symbols<CR>', desc = 'Buffer symbols' },
        { mode = 'n', lhs = '<leader>fS', rhs = ':Telescope lsp_workspace_symbols<CR>', desc = 'Workspace symbols' },
        { mode = 'n', lhs = '<leader>fi', rhs = ':Telescope lsp_incoming_calls<CR>', desc = 'Incoming calls' },
        { mode = 'n', lhs = '<leader>fo', rhs = ':Telescope lsp_outgoing_calls<CR>', desc = 'Outgoing calls' },

        { mode = 'n', lhs = '[d', rhs = function() vim.diagnostic.jump({ count = -1 }) end, desc = 'Prev diagnostic' },
        { mode = 'n', lhs = ']d', rhs = function() vim.diagnostic.jump({ count = 1 }) end, desc = 'Next diagnostic' },
        -- stylua: ignore end
        { mode = 'n', lhs = '<leader>tl', rhs = vim.diagnostic.open_float, desc = 'current line diagnostics' },
        { mode = 'n', lhs = '<leader>ti', rhs = toggle_inline_diagnostics, desc = 'inline-diagnostics' },
      }
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
    -- Fix encoding issues: multiple different client offset_encodings detected for buffer (c, cpp file)
    local capabilities_utf_16 = vim.tbl_deep_extend('force', {}, capabilities, {
      offsetEncoding = { 'utf-16' },
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
    lsp_config('clangd', {
      on_attach = on_attach,
      capabilities = capabilities_utf_16,
      filetypes = { 'c', 'cpp' },
    })
    lsp_config('ruff', {
      on_attach = function(client)
        client.server_capabilities.hoverProvider = false
        client.server_capabilities.completionProvider = false
      end,
      filetypes = { 'python' },
    })
    lsp_config('emmet_ls', {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { 'html', 'css', 'javascriptreact' },
    })

    local home = vim.fn.expand('~')
    local jdtls_path = home .. '/.local/share/nvim/mason/packages/jdtls'
    local lombok_path = home .. '/.local/share/lombok/lombok.jar'
    local jdtls_launcher = vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar')
    local config_path = jdtls_path .. '/config_mac'
    local workspace_path = home .. '/.cache/jdtls/workspace'
    lsp_config('jdtls', {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { 'java' },
      cmd = {
        'java', -- run interpreter
        '-javaagent:' .. lombok_path, -- for annotation processing
        '-Xbootclasspath/a:' .. lombok_path, -- add to JVM boot classpath
        -- Eclipse JDTLS properties
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-jar', -- main JDTLS searver launcher
        jdtls_launcher,
        -- Mac specific JDTLS config
        '-configuration',
        config_path,
        -- path to workspace specific data
        '-data',
        workspace_path,
      },
    })
    lsp_config('gopls', {
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = { 'gopls' },
      filetypes = { 'go', 'gomod', 'gosum', 'gowork', 'gotmpl' },
      settings = {
        gopls = {
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
            shadow = true,
          },
          staticcheck = true,
        },
      },
    })
  end,
}
