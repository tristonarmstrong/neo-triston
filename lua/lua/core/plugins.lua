-- LAZY config
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    'nvim-treesitter/nvim-treesitter',
    { import = "core.plugin_config.navic" },
    { import = "core.plugin_config.comment" },
    { import = "core.plugin_config.illuminate" },
    { import = "core.plugin_config.indent-blankline" },
    { import = "core.plugin_config.mason" },
    { import = "core.plugin_config.nvim-cmp" },
    { import = "core.plugin_config.nvim-tree" },
    { import = "core.plugin_config.telescope" },
    { import = "core.plugin_config.lazygit" },
    --    { import = "core.plugin_config.oil" },
    { import = "core.plugin_config.whichkey" },
    { import = "core.plugin_config.dashboard" },
    { import = "core.plugin_config.lualine" },
    --   { import = "core.plugin_config.sidebar" },
    --    { import = "core.plugin_config.twilight" },
    --    { import = "core.plugin_config.load_vscode_snippets" },
    { import = "core.plugin_config.coc" },
    --    { import = "core.plugin_config.discordPresence" },
    --    { import = "core.plugin_config.tabnine" },
  },
  {
    ui = {
      border = "solid",
      title = "Lazy Window"
    },
    checker = {
      enabled = false,
    },
    change_detection = {
      notify = false
    }
  })
