return {
  'L3MON4D3/LuaSnip',
  build = 'make install_jsregexp',
  config = function()
    local luasnip = require('luasnip')

    luasnip.config.setup({
      history = true,
      enable_autosnippets = true,
      region_check_events = 'CursorMoved,CursorHold,InsertEnter',
      delete_check_events = 'TextChanged,TextChangedI',
      updateevents = 'TextChanged,TextChangedI',
    })

    vim.keymap.set({ 'i', 's' }, '<Tab>', function()
      luasnip.jump(1)
    end, { silent = true })

    require('luasnip.loaders.from_lua').lazy_load({
      paths = { '~/.config/nvim/snippets' },
    })
  end,
}
