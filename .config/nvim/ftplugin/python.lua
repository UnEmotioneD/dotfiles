vim.keymap.set('n', '<leader>dpr', function()
  require('dap-python').test_method()
end, { desc = 'Debugger testables' })
