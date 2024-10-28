return {
  {
    'mfussenegger/nvim-jdtls',
    config = function()
      vim.keymap.set('n', '<leader>i', '<cmd>lua require"jdtls".organize_imports()<CR>')
    end,
  },
}
