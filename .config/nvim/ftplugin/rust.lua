local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set('n', '<leader>a', function()
  vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
end, { silent = true, buffer = bufnr })

-- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
vim.keymap.set('n', 'K', function()
  vim.cmd.RustLsp({ 'hover', 'actions' })
end, { silent = true, buffer = bufnr })

-- rustaceanvim
vim.keymap.set('n', '<leader>dt', "<Cmd>lua vim.cmd('RustLsp testables')<CR>", { desc = '[D]ebugger: testables' })

vim.g.rustaceanvim = {
  server = {
    cmd = { '/Users/unemotioned/.cargo/bin/rust-analyzer' },
  },
}
