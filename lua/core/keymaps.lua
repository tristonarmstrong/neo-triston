vim.cmd([[set number]])
vim.g.mapleader = " "
vim.g.maplocalleader = vim.g.mapleader

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.shiftround = true 
vim.opt.expandtab = true

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.keymap.set('n', '<leader>gg', "<cmd>LazyGit<CR>", {desc="opens lazygit as window"})

