return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local neotree = require('neo-tree')
    neotree.setup({
      close_if_last_window = true,
      window = {
        position = 'float'
      },
      source_selector = {
        winbar = true,
      },
      filesystem = {
        follow_current_file = {
          enabled = true
        }
      },
      buffers = {
        follow_current_file = {
          enabled = true
        }
      }
    })
  end
}
