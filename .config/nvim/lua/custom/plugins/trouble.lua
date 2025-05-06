return {
  'folke/trouble.nvim',
  opts = {},
  cmd = 'Trouble',
  auto_preview = false,
  keys = {
    {
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
  },
}
