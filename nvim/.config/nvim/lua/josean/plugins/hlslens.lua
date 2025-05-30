return {
  'kevinhwang91/nvim-hlslens',
  event = 'VeryLazy',
  config = function()
    require('hlslens').setup({
      calm_down = true,
      nearest_only = true,
      nearest_float_when = 'never',
    })

    local hlslens_key = function(key)
      return string.format(":execute('normal! ' .. v:count1 .. '%szz')<CR>:lua require('hlslens').start()<CR>", key)
    end

    vim.keymap.set('n', 'n', hlslens_key('n'), { desc = 'Next hlsearch', noremap = true, silent = true })
    vim.keymap.set('n', 'N', hlslens_key('N'), { desc = 'Prev hlsearch', noremap = true, silent = true })
  end,
}
