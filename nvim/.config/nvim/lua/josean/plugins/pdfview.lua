-- $ sudo apt install poppler-utils
return {
  'basola21/PDFview',
  lazy = false,
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    local pdf = require('pdfview.renderer')
    local map = vim.keymap.set

    map('n', '<leader>jj', function()
      pdf.next_page()
    end, { desc = 'PDFview: Next page' })

    map('n', '<leader>kk', function()
      pdf.previous_page()
    end, { desc = 'PDFview: Previous page' })
  end,
}
