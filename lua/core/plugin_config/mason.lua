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
          require('lspconfig')[server_name].setup {
            on_attach = function(_, _)
              vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
              vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

              vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
              vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
              vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
              vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
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
