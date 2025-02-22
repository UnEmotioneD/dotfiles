return {
  'echasnovski/mini.move',
  version = '*',
  opts = {
    -- Module mappings. Use `''` (empty string) to disable one.
    mappings = {
      -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
      left = '<S-h>',
      down = '<S-j>',
      up = '<S-k>',
      right = '<S-l>',

      -- Move current line in Normal mode
      line_left = '',
      line_down = '',
      line_up = '',
      line_right = '',
    },

    -- Options which control moving behavior
    options = {
      -- Automatically reindent selection during linewise vertical move
      reindent_linewise = true,
    },
  },
}
