return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    config = function()
      require('noice').setup {
        routes = {
          -- show @recording messages as notifications
          -- https://github.com/folke/noice.nvim/wiki/A-Guide-to-Messages#showmode
          {
            filter = {
              event = 'msg_showmode',
            },
            view = 'notify',
          },
        },
      }
      require('telescope').load_extension 'noice'
      vim.keymap.set('n', '<leader>nd', '<cmd>NoiceDismiss<CR>')
    end,
  },
}
