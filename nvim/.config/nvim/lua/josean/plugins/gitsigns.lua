return {
  'lewis6991/gitsigns.nvim',
  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, lhs, rhs, opts)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = opts })
      end

      -- stylua: ignore start
      map('n', '[h', gs.prev_hunk, 'Prev hunk')
      map('n', ']h', gs.next_hunk, 'Next hunk')

      map('n', '<leader>hs', gs.stage_hunk, 'Stage hunk')
      map('n', '<leader>hr', gs.reset_hunk, 'Reset hunk')

      map('v', '<leader>hs', function() gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, 'Stage selected')
      map('v', '<leader>hr', function() gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end, 'Reset selected')

      map('n', '<leader>hS', gs.stage_buffer, 'Stage buffer')
      map('n', '<leader>hR', gs.reset_buffer, 'Reset buffer')
      map('n', '<leader>hu', gs.undo_stage_hunk, 'Undo last stage')

      map('n', '<leader>hp', gs.preview_hunk, 'Preview hunk')

      map('n', '<leader>hb', function() gs.blame_line({ full = true }) end, 'Toggle blame (pop-up)')
      map('n', '<leader>hB', gs.toggle_current_line_blame, 'Toggle Blame (in-line)')

      map('n', '<leader>hd', gs.diffthis, 'Diff this file')
      map('n', '<leader>hD', function() gs.diffthis '@' end, 'Diff against last commit')

      map('n', '<leader>hq', gs.setqflist, 'Buffer diffs to qflist')
      map('n', '<leader>hQ', function() gs.setqflist('all') end, 'Workspace diffs to qflist')

      map('n', '<leader>ht', gs.toggle_deleted, 'Toggle deleted hunks')
      map('n', '<leader>hw', gs.toggle_word_diff, 'Toggle word diff')

      map({ 'o', 'x' }, 'ih', gs.select_hunk, 'Select hunk')
      -- stylua: ignore end
    end,
  },
}
