return {
  {
    'folke/twilight.nvim',
    config = function()
      require('twilight').setup {
        dimming = {
          alpha = 0.35,
        },
        context = 20,
      }
      vim.keymap.set('n', '<leader>t', '<cmd>Twilight<CR>')
    end,
  },
}
