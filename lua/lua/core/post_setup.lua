vim.cmd [[colorscheme slate]]
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
