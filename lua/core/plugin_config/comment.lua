-- comments code obviously
return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require('Comment').setup({
      toggler = {
        line = '<leader>/',
      }
    })
  end
}
