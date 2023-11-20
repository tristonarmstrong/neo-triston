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
vim.opt.ai = true            -- auto indent
vim.opt.si = true            -- smart indent
vim.opt.scrolloff = 10
vim.opt.wrap = false         -- no wrap lines
vim.opt.path:append { '**' } -- finding files - search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }

vim.keymap.set('n', '<leader>gg', "<cmd>LazyGit<CR>", { desc = "opens lazygit as window" })

-- Do not yank when deleting
vim.keymap.set('n', 'x', '"_x')

-- increment/decrement
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')


-- lsp config
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gl', function()
  local float = vim.diagnostic.config().float

  if float then
    local config = type(float) == "table" and float or {}
    config.scope = "line"

    vim.diagnostic.open_float(config)
  end
end
, { desc = "Hover diagnostic" })
