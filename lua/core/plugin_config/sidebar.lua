return {
  'GustavoKatel/sidebar.nvim',
  event = 'BufNew',
  config = function()
    require('sidebar-nvim').setup({
      open = true,
      disable_default_keybindings = 0,
      bindings = nil,
      side = "right",
      initial_width = 35,
      hide_statusline = false,
      update_interval = 1000,
      sections = { "datetime", "git", "diagnostics", "todos", "buffers", "symbols" },
      section_separator = { "", "---------------", "" },
      section_title_separator = { "" },
      containers = {
        attach_shell = "/bin/sh", show_all = true, interval = 5000,
      },
      datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
      todos = { ignored_paths = { "~" } },
      buffers = {
        icon = "",
        ignored_buffers = {},     -- ignore buffers by regex
        sorting = "id",           -- alternatively set it to "name" to sort by buffer name instead of buf id
        show_numbers = true,      -- whether to also show the buffer numbers
        ignore_not_loaded = true, -- whether to ignore not loaded buffers
        ignore_terminal = true,   -- whether to show terminal buffers in the list
      }
    })
  end
}
