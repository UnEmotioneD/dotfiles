return {
  'tpope/vim-fugitive',
  lazy = true,
  cmd = { 'Gvdiffsplit' },
  keys = {
    { '<leader>gd', '<cmd>Gvdiffsplit!<CR>', { desc = '3-way diff' } },
  },
  config = function()
    function RemoveCurrentGitConflictMarkers()
      local bufnr = vim.api.nvim_get_current_buf()
      local cursor = vim.api.nvim_win_get_cursor(0)[1]
      local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

      local top, base, mid, bot = nil, nil, nil, nil

      -- find <<<<<<< above cursor
      for i = cursor, 1, -1 do
        if lines[i]:match('^<<<<<<<') then
          top = i
          break
        end
      end

      if not top then
        return
      end

      -- scan downward for |||||||, =======, >>>>>>>
      for i = top + 1, #lines do
        if not base and lines[i]:match('^|||||||') then
          base = i
        elseif not mid and lines[i]:match('^=======') then
          mid = i
        elseif lines[i]:match('^>>>>>>>') then
          bot = i
          break
        end
      end

      if not (mid and bot) then
        return
      end

      -- delete bottom → top (safe order)
      vim.api.nvim_buf_set_lines(bufnr, bot - 1, bot, false, {})
      vim.api.nvim_buf_set_lines(bufnr, mid - 1, mid, false, {})
      if base then
        vim.api.nvim_buf_set_lines(bufnr, base - 1, base, false, {})
      end
      vim.api.nvim_buf_set_lines(bufnr, top - 1, top, false, {})
    end

    vim.keymap.set('n', '<leader>gh', function()
      vim.cmd('diffget //2')
      RemoveCurrentGitConflictMarkers()
    end, { desc = 'Accept Local (Left)' })

    vim.keymap.set('n', '<leader>gl', function()
      vim.cmd('diffget //3')
      RemoveCurrentGitConflictMarkers()
    end, { desc = 'Accept Remote (Right)' })
  end,
}
