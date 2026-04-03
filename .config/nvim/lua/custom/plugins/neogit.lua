return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = true,
  vim.keymap.set('n', '<leader>gn', '<cmd>Neogit<CR>'),
}
