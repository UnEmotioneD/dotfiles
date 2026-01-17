return {
  {
    -- use nvim-cmp completion source with blink.cmp
    'saghen/blink.compat',
    version = '*',
    lazy = true, -- Automatically loads when required by blink.cmp
    opts = {},
  },
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },

    -- use a release tag to download pre-built binaries
    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'default',
        ['<C-Space>'] = { 'show' },
        ['<C-y>'] = { 'select_and_accept' },

        ['<C-j>'] = { 'select_next' },
        ['<C-k>'] = { 'select_prev' },

        ['<C-b>'] = { 'scroll_documentation_up' },
        ['<C-f>'] = { 'scroll_documentation_down' },

        ['<Up>'] = false,
        ['<Down>'] = false,
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
      },

      completion = {
        menu = { border = 'single' },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 1000,
          window = { border = 'single' },
        },
      },

      -- show function args
      signature = {
        enabled = true,
        window = { border = 'single' },
      },

      -- snippets source to use L3MON4D3/LuaSnip
      snippets = { preset = 'luasnip' },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer', 'html-css' },
        providers = {
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
          ['html-css'] = {
            name = 'html-css',
            module = 'blink.compat.source',
          },
        },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
    opts_extend = { 'sources.default' },
  },
}
