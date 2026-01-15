return {
  -- ghostty config file syntax highlighting
  {
    'bezhermoso/tree-sitter-ghostty',
    build = 'make nvim_install',
    enabled = false,
  },
  -- validate config
  {
    'isak102/ghostty.nvim',
    config = function()
      require('ghostty').setup({
        -- default configs
        file_pattern = '*/ghostty/config',
        ghostty_cmd = 'ghostty',
        check_timeout = 1000,
      })
    end,
    enabled = false,
  },
}
