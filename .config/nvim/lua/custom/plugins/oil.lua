return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    view_options = {
      show_hidden = true,
    },
  },
  dependencies = {
    {
      'echasnovski/mini.icons',
      opts = {},
    },
  },
  keys = {
    { '-', '<cmd>Oil<CR>', desc = 'Open Oil file explorer' },
  },
}
