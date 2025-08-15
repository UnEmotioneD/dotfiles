return {
  'L3MON4D3/LuaSnip',
  build = 'make install_jsregexp',
  config = function()
    local luasnip = require('luasnip')
    local cmp = require('cmp')

    luasnip.config.setup({
      history = true,
      enable_autosnippets = true,
      region_check_events = 'CursorMoved,CursorHold,InsertEnter',
      delete_check_events = 'TextChanged,TextChangedI',
      updateevents = 'TextChanged,TextChangedI',
    })

    cmp.setup({
      mapping = {
        ['<Tab>'] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
    })

    require('luasnip.loaders.from_lua').lazy_load({
      paths = { '~/.config/nvim/snippets' },
    })
  end,
}
