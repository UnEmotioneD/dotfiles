return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-buffer', -- source for text in buffer
    'hrsh7th/cmp-path', -- source for file system paths
    'hrsh7th/cmp-cmdline', -- source for nvim cmds
    'saadparwaiz1/cmp_luasnip', -- for autocompletion
    'rafamadriz/friendly-snippets', -- useful snippets
    'onsails/lspkind.nvim', -- vs-code like pictograms
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup({
      completion = {
        completeopt = 'menu,menuone,preview,noselect',
      },
      performance = {
        max_view_entries = 10,
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered({ border = 'single' }),
        documentation = cmp.config.window.bordered({ border = 'single' }),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- select first suggestion if none selected
        ['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
        ['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(), -- show completion suggestions
        ['<C-e>'] = cmp.mapping.abort(), -- close completion window
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- close completion window if none selected
        -- disable arrow for selection (because I use arrow for navigation)
        ['<UP>'] = cmp.config.disable,
        ['<DOWN>'] = cmp.config.disable,
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- custom snippets
        { name = 'buffer' }, -- text within current buffer
        { name = 'path' }, -- file system paths
        { name = 'render-markdown' }, -- add suggestions for markdown
      }),

      format = function(entry, vim_item)
        -- De-duplicate common sources
        if entry.source.name == 'nvim_lsp' or entry.source.name == 'buffer' then
          vim_item.dup = 0
        end

        -- Use Treesitter to detect if inside function args, and adjust display accordingly
        local node = require('nvim-treesitter.ts_utils').get_node_at_cursor()
        if node and node:type() == 'arguments' and (entry.completion_item.kind or 0) ~= 6 then
          vim_item.menu = '[...]' -- visually mark low-priority suggestions
        end

        -- Add VS Code-style icons and trim long items
        return require('lspkind').cmp_format({
          maxwidth = 50,
          ellipsis_char = '…',
        })(entry, vim_item)
      end,

      sorting = {
        priority_weight = 2,
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          -- Prioritize functions when inside function arguments
          function(entry1, entry2)
            local kind1 = entry1:get_kind()
            local kind2 = entry2:get_kind()
            if kind1 == 6 and kind2 ~= 6 then
              return true
            end
            if kind2 == 6 and kind1 ~= 6 then
              return false
            end
          end,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
    })

    -- Snippets for search or directory
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' },
      },
    })

    -- Snippets for cmd
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

    -- For Cargo.toml enable crates.nvim completion
    cmp.setup.filetype('toml', {
      sources = cmp.config.sources({
        { name = 'crates' },
        { name = 'buffer' }, -- Optionally add buffer completion
      }),
    })
  end,
}
