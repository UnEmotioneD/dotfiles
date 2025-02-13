return {
  'akinsho/bufferline.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  version = '*',
  opts = {
    options = {
      ---@type string | "buffers" | "tabs"
      mode = 'tabs',
      ---@type string | "slant" | "slope" | "thick" | "thin"
      separator_style = 'slant',
    },
  },
  enabled = false,
}
