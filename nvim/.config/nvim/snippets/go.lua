local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

return {
  s(
    'main',
    fmt(
      [[
      package main

      import "fmt"

      func main() {{
        {}
      }}
      ]],
      {
        i(0),
      }
    )
  ),
  s('print', fmt('fmt.Println({})', { i(0) })),
}
