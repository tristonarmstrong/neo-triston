return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup({
      theme = 'hyper',
      config = {
        header = {
          "_,--=--._",
          ",'    _    `.",
          "-    _(_)_o   -",
          "____'    /_  _/]    `____",
          "-=====::(+):::::::::::::::::(+)::=====-",
          '(+).""""""""""""",(+)',
          ".           ,",
          "`  -=-  '",
          "  /  \\ ",
          "  /    \\ ",
          "  /      \\ ",
          "  /        \\ ",
          "  /          \\ ",
          "",
          "",
          "",
        },
        week_header = {
          enable = false,
        },
        shortcut = {
          { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            desc = ' Apps',
            group = 'DiagnosticHint',
            action = 'Telescope app',
            key = 'a',
          },
          {
            desc = ' dotfiles',
            group = 'Number',
            action = 'Telescope dotfiles',
            key = 'd',
          },
        },
      },
    })

    vim.keymap.set('n', '<leader>q', '<cmd>Dashboard<CR>', { desc = "Opens the dashboard" })
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}
