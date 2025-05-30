return {
  'michaelrommel/nvim-silicon',
  event = 'VeryLazy',
  config = function()
    local silicon = require('nvim-silicon')

    silicon.setup({
      font = 'JetBrainsMono Nerd Font=20',
      theme = 'OneHalfDark',
      background = '#21252b',
      pad_horiz = 80,
      pad_vert = 80,
      no_round_corner = true,

      line_offset = function(args)
        return args.line1
      end,

      language = function()
        return vim.bo.filetype
      end,

      shadow_color = '#100808',

      window_title = function()
        return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ':t')
      end,

      output = function()
        return '~/Documents/silicon/' .. os.date('!%Y-%m-%dT%H-%M-%SZ') .. '.png'
      end,
    })

    vim.keymap.set('v', '<leader>sc', function()
      silicon.clip()
    end, { desc = 'Screenshot to clipboard' })
    vim.keymap.set('v', '<leader>ss', function()
      silicon.shoot()
    end, { desc = 'Screenshot to file' })
  end,
}
