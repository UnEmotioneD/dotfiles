local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

return {
  s(
    '!',
    fmt(
      [[
      <!doctype html>
      <html lang="en">
        <head>
          <meta charset="UTF-8" />
          <meta name="viewport" content="width=device-width, initial-scale=1.0" />
          <title>{}</title>
          <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
          <link rel="stylesheet" href="{}.css" />
          <style></style>
        </head>
        <body>
          {}
        </body>
        <script></script>
      </html>
      ]],
      {
        i(1),
        i(2, 'style'),
        i(0),
      }
    )
  ),
  s('log', fmt('console.log({})', { i(0) })),
}
