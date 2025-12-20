local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

return {
  s(
    'react',
    fmt(
      [[
      import React from 'react'

      const {} = () => {{
        {}
        return ({})
      }}

      export default {}
      ]],
      {
        i(1),
        i(2),
        i(0),
        rep(1),
      }
    )
  ),
}
