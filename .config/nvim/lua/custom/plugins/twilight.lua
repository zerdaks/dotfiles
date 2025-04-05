return {
  'folke/twilight.nvim',
  opts = {
    dimming = {
      alpha = 0.35,
    },
    context = 20,
  },
  vim.keymap.set('n', '<leader>t', '<cmd>Twilight<CR>'),
  config = function()
    require('twilight').enable() -- load twilight on startup
  end,
}
