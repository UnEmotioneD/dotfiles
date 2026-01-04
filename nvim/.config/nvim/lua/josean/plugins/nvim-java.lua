return {
  'nvim-java/nvim-java',
  config = function()
    require('java').setup({
      -- Startup checks
      checks = {
        nvim_version = true,
        nvim_jdtls_conflict = true,
      },
      jdtls = {
        version = '1.43.0', -- jdk@17
        -- version = '1.54.0', -- jdk@21
      },
      lombok = {
        enable = false,
        version = '1.18.40',
      },
      spring_boot_tools = {
        enable = false,
        version = '1.55.1',
      },
      java_test = {
        enable = false,
      },
      java_debug_adapter = {
        enable = false,
      },
      jdk = {
        auto_install = false,
      },
    })
    vim.lsp.enable('jdtls')
  end,
}
