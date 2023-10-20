return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "UIEnter",
  lazy=true,
  config = function()
    require('oil').setup()

    vim.keymap.set("n", "<leader>-", "<cmd>Oil<CR>", { desc = "Open parent directory as buff" })
  end
}
