local ls = require('luasnip')
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt
local rep = require('luasnip.extras').rep

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
          <link rel="stylesheet" type="text/css" href="{}.css" />
          <style></style>
        </head>
        <body>
          <h3>{}</h3>
          <hr />
          {}
        </body>
        <script></script>
      </html>
      ]],
      {
        i(1),
        i(2, 'style'),
        rep(1),
        i(0),
      }
    )
  ),

  s(
    'diva',
    fmt(
      [[
      <div>
        <a href="./src/{}.html">{}</a>
      </div>
      ]],
      {
        i(1),
        rep(1),
      }
    )
  ),
}
