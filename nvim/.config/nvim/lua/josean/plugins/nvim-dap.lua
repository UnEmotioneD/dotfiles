return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio', -- required by dap-ui
    'jay-babu/mason-nvim-dap.nvim',
    { 'mfussenegger/nvim-dap-python', ft = 'python' },
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')
    local mason_dap = require('mason-nvim-dap')

    dapui.setup()

    dap.listeners.after.event_initialized['dap_repl'] = function()
      dap.repl.open()
    end
    dap.listeners.before.event_terminated['dap_repl'] = function()
      dap.repl.close()
    end
    dap.listeners.before.event_exited['dap_repl'] = function()
      dap.repl.close()
    end

    mason_dap.setup({
      ensure_installed = { 'python' },
      automatic_installation = false,
      handlers = {},
    })

    local dappy = require('dap-python')
    local path = vim.fn.expand('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python')

    dappy.setup(path)

    local map = vim.keymap.set

    -- Genearl debugger
    map('n', '<F1>', dap.step_into, { desc = 'Step Into' })
    map('n', '<F2>', dap.step_over, { desc = 'Step Over' })
    map('n', '<F3>', dap.step_out, { desc = 'Step Out' })
    map('n', '<F5>', dap.continue, { desc = 'Start/Continue Debugging' })
    map('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
    map('n', '<leader>B', function()
      vim.ui.input({ prompt = 'Breakpoint condition: ' }, function(input)
        if input then
          dap.set_breakpoint(input)
        end
      end)
    end, { desc = 'Set Conditional Breakpoint' })
    map('n', '<leader>dc', dap.run_to_cursor, { desc = 'Run to Cursor' })
    map('n', '<leader>dr', dap.repl.open, { desc = 'Open REPL' }) -- Read Eval Print Loop
    map('n', '<leader>dl', dap.run_last, { desc = 'Run last session' })
    map('n', '<leader>dt', dap.terminate, { desc = 'Terminate session' })

    map('n', '<leader>de', dapui.eval, { desc = 'Eval expression' })
    map('n', '<F7>', dapui.toggle, { desc = 'Toggle UI' })
  end,
}
