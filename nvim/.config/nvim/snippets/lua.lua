local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

return {
  s(
    'config',
    fmt(
      [[
      config = function()
        local {} = require('{}')

        {}.setup({})
      end,
     ]],
      {
        i(1),
        rep(1),
        rep(1),
        i(0),
      }
    )
  ),
}
