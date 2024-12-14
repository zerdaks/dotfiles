return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = true,
    vim.keymap.set('n', '<leader>ng', '<cmd>Neogit<CR>'),
  },
}
