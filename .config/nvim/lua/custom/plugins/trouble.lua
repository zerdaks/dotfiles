return {
  'folke/trouble.nvim',
  opts = {
    auto_preview = false,
    focus = true,
    warn_no_results = false,
    open_no_results = true,
  },
  cmd = 'Trouble',
  keys = {
    {
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
  },
}
