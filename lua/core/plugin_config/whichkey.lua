return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require('which-key')

    wk.register({
      ["<leader>"] = {
        h = { '<cmd>nohlsearch<CR>', "Highlight Off" },
        g = { name = "Git" },
        b = {
          name = "Buffer",
          c = { "<cmd>bdelete<cr>", "Close" }
        }
      }
    })
  end
}
