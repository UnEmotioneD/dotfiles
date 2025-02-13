return {
  {
    'mfussenegger/nvim-dap',
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
      local dap, dapui = require('dap'), require('dapui')

      dapui.setup()

      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end

      local map = vim.keymap

      map.set('n', '<leader>du', dapui.toggle, { desc = '[D]ebugger: Toggle [u]i' })
      map.set('n', '<leader>de', dapui.eval, { desc = '[D]ebugger: Show [e]xpression' })

      map.set('n', '<leader>dc', dap.continue, { desc = '[D]ebugger: [c]ontinue' })
      map.set('n', '<leader>dt', dap.terminate, { desc = '[D]ebugger: [t]erminate' })
      map.set('n', '<leader>dr', dap.run_last, { desc = '[D]ebugger: [r]un Last' })
      map.set('n', '<leader>di', dap.step_into, { desc = '[D]ebugger: Step [i]nto' })
      map.set('n', '<leader>do', dap.step_over, { desc = '[D]ebugger: Step [o]ver' })
      map.set('n', '<leader>dO', dap.step_out, { desc = '[D]ebugger: Step [O]ut' })
      map.set('n', '<leader>db', dap.toggle_breakpoint, { desc = '[D]ebugger: Toggle [b]reakpoint' })
      map.set('n', '<leader>dB', function()
        dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
      end, { desc = '[D]ebugger: Conditional [B]reakpoint' })
    end,
  },
}
