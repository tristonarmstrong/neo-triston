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
      source_selector = {
        winbar = true,
      },
    })
  end
}
