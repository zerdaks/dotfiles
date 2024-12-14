return {
  {
    'stevearc/oil.nvim',
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    vim.keymap.set('n', '-', '<cmd>Oil<CR>'),
  },
}
