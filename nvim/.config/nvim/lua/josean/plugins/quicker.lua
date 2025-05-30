return {
  'stevearc/quicker.nvim',
  event = 'FileType qf',
  opts = {
    opts = {
      number = true,
      relativenumber = true,
    },
    keys = {
      {
        '<',
        function()
          require('quicker').collapse()
        end,
        desc = 'Collapse quickfix content',
      },
      {
        '>',
        function()
          require('quicker').expand()
        end,
        desc = 'Expand quickfix content',
      },
    },
  },
  keys = {
    {
      '<leader>qq',
      function()
        if vim.tbl_isempty(vim.fn.getqflist()) then
          vim.notify('Empty qflist', vim.log.levels.INFO)
          return
        else
          require('quicker').toggle()
        end
      end,
      desc = 'Toggle qflist',
    },
  },
}
