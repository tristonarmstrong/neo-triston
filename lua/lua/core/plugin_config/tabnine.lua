return {
  'codota/tabnine-nvim',
  build = './dl_binaries.sh',
  config = function()
    require('tabnine').setup({
      disable_auto_comment = true,
      accept_keymap = "q",
      dismiss_keymap = "<C-]>",
      debounce_ms = 800,
      suggestion_color = { gui = "#008000", cterm = 244 },
      exclude_filetypes = { "TelescopePrompt", "NvimTree", "Presence" },
      log_file_path = nil
    })
  end
}
