local dap = require('dap')
local dappy = require('dap-python')
local dapui = require('dapui')

local map = vim.keymap.set

map('n', '<leader>dpc', dappy.test_class, { desc = 'Class' })
map('n', '<leader>dpm', dappy.test_method, { desc = 'Method' })
map('n', '<leader>dps', function()
  dap.continue()
  dapui.open()
end, { desc = 'Start and Open UI' })
