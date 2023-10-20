return {
  "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    event = "VimEnter",
    dependencies = { 
	    "nvim-lua/plenary.nvim",
    },
    lazy=false,
    cmd = "Telescope",
    config = function()
	require('telescope').setup()
	local builtin = require('telescope.builtin')
	local keys = vim.keymap

	keys.set('n', '<leader>ff', builtin.find_files, {})
	keys.set('n', '<leader>fg', builtin.live_grep, {})
	keys.set('n', '<leader>fb', builtin.buffers, {})
	keys.set('n', '<leader>fh', builtin.help_tags, {})
    end
  }
