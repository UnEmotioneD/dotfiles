return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp', -- LSP completion source
    'hrsh7th/cmp-buffer', -- words in buffer
    'hrsh7th/cmp-cmdline', -- nvim commands
    'hrsh7th/cmp-path', -- filesystem paths
    'onsails/lspkind.nvim', -- vscode style icons
    'rafamadriz/friendly-snippets', -- prebuilt snippets
    'saadparwaiz1/cmp_luasnip', -- snippet engine integration
  },

  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local lspkind = require('lspkind')
    local kinds = require('cmp.types').lsp.CompletionItemKind

    -- Load vscode style snippets
    require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup({
      completion = {
        completeopt = 'menu,menuone,preview,noselect',
      },
      performance = {
        max_view_entries = 10,
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered({ border = 'single' }),
        documentation = cmp.config.window.bordered({ border = 'single' }),
      },

      mapping = cmp.mapping.preset.insert({
        ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- accept first suggestion
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        -- disable selecting with arrow keys
        ['<Up>'] = cmp.config.disable,
        ['<Down>'] = cmp.config.disable,
      }),

      sources = cmp.config.sources({
        { name = 'nvim_lsp', dup = 0 },
        { name = 'luasnip' }, -- custom snippets
        { name = 'path', dup = 0 },
        { name = 'buffer', dup = 0 },
        { name = 'render-markdown' }, -- source from marksman
        { name = 'html-css' }, -- css id and class inside html
      }),

      formatting = {
        -- order of suggestion item
        fields = { 'abbr', 'kind', 'menu' },
        format = function(entry, vim_item)
          -- De-duplicate common sources
          if entry.source.name == 'nvim_lsp' or entry.source.name == 'buffer' then
            vim_item.dup = nil
          end

          -- Use Treesitter to detect if inside function args
          local node = vim.treesitter.get_node()
          if node and node:type() == 'arguments' and entry:get_kind() ~= kinds.Function then
            vim_item.menu = '[…]'
          end

          -- Add icons + trim long entries
          return lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = '…',
          })(entry, vim_item)
        end,
      },

      sorting = {
        priority_weight = 2, -- increasee weight than default
        comparators = {
          cmp.config.compare.offset, -- cursor position
          cmp.config.compare.exact, -- exact matches
          cmp.config.compare.score, -- fuzzy match score

          -- Prioritize functions when inside function arguments
          function(e1, e2)
            if e1:get_kind() == kinds.Function and e2:get_kind() ~= kinds.Function then
              return true
            end
            if e2:get_kind() == kinds.Function and e1:get_kind() ~= kinds.Function then
              return false
            end
          end,

          -- Built-in fallback comparisons
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
    })

    -- Search completion
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      },
    })

    -- Command mode completion
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        {
          name = 'cmdline',
          option = {
            ignore_cmds = { 'Man', '!' },
          },
        },
      }),
    })
  end,
}
