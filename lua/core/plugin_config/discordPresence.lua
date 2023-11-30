return {
  "andweeb/presence.nvim",
  config = function()
    require('presence').setup({
      auto_update = true,
      neovim_image_text = "neo-triston",
      main_image = "neovim",
      debounce_timeout = 1000,
      enable_line_number = true,
      buttons = true,
      show_time = false,

      editing_text = "Editing notUrBiz.rs",
      file_explorer_text = "Browsing theMultiverse/*",
      git_commit_text = "Commiting changes",
      plugin_manager_text = "Managing plugins",
      reading_text = "Reading theSecretsOfTheUniverse.txt",
      workspace_text = "Working on metaWorkspace",
      line_number_text = "Line %s out of %s",

    })
  end
}
