return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    routes = {
      -- show recording messages as notifications
      {
        view = 'notify',
        filter = {
          event = 'msg_showmode',
        },
      },
    },
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
}
