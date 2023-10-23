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
          c = { "<cmd>bdelete<cr>", "Close" },
          n = { "<cmd>bnext<cr>", "Next" },
          p = { "<cmd>bprev<cr>", "Previous" }
        },
        s = {
          name = "Sidebar",
          c = { "<cmd>SidebarNvimClose<cr>", "Close" },
          f = { "<cmd>SidebarNvimFocus<cr>", "Focus" },
          o = { "<cmd>SidebarNvimOpen<cr>", "Open" }
        },
        t = {
          name = "Twilight",
          t = { "<cmd>Twilight<cr>", "toggle" }
        },
        e = {
          name = "NeoTree",
          e = { "<cmd>Neotree toggle<cr>", "toggle" },
          f = { "<cmd>Neotree focus<cr>", "focus" }
        },
        q = { "<cmd>q<cr>", "Quit" },
        l = {
          name = "lsp"
        }
      }
    })
  end
}
