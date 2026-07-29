return {
  'mfussenegger/nvim-jdtls',
  ft = 'java',
  config = function()
    vim.keymap.set('n', '<leader>i', function()
      require('jdtls').organize_imports()
    end, { desc = 'Organize imports' })
  end,
}
