return {
  'nvim-java/nvim-java',
  config = function()
    require('java').setup({
      -- competibility with jdk@17
      jdtls = {
        version = '1.43.0',
      },
      lombok = {
        enable = false,
        version = '1.18.40',
      },
      spring_boot_tools = {
        enable = false,
        version = '1.55.1',
      },
      java_test = { enable = false },
      java_debug_adapter = { enable = false },
      jdk = { auto_install = false },
    })
    vim.lsp.enable('jdtls')
  end,
}
