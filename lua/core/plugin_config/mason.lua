return {
  {
    "williamboman/mason.nvim",
    config = true,
    dependencies = {
      "williamboman/mason-lspconfig.nvim"
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason').setup()
      local mason_lspconfig = require('mason-lspconfig')

      mason_lspconfig.setup_handlers({
        function(server_name)
          local capabilities = require('cmp_nvim_lsp').default_capabilities()
          require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = function(_, _)
              vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
            end
          }
        end
      })

      mason_lspconfig.setup({
        ensure_installed = { "lua_ls" }
      })
    end
  },
  "nvim-lspconfig"
}
