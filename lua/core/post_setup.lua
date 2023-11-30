vim.cmd "let g:material_theme_style = 'ocean'"
vim.cmd "let g:material_terminal_italics = 1"
vim.cmd "colorscheme material"
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]


-- Indent blankline
vim.opt.list = true
vim.opt.listchars:append "eol:⤵"
