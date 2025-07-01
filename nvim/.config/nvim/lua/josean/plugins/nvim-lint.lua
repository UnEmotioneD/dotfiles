return {
  'mfussenegger/nvim-lint',
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      c = { 'cpplint' },
      cpp = { 'cpplint' },
      python = { 'pylint' },
      javascript = { 'eslint_d' },
      typescript = { 'eslint_d' },
      javascriptreact = { 'eslint_d' },
      typescriptreact = { 'eslint_d' },
      markdown = { 'markdownlint' },
    }

    ---@return vim.Diagnostic | nil
    lint.linters.eslint_d = require('lint.util').wrap(lint.linters.eslint_d, function(diagnostic)
      if diagnostic.message:find('Error: Could not find config file') then
        return nil
      end
      return diagnostic
    end)

    -- ignore "Could not find config file. eslint_d" error for javascript files
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        -- Only run the linter in buffers that you can modify in order to
        --  avoid superfluous noise, notably within the handy LSP pop-ups that
        --  describe the hovered symbol using Markdown.
        if vim.bo.modifiable then
          lint.try_lint()
        end
      end,
    })
  end,
}
