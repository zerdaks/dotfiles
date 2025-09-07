return {
  {
    'github/copilot.vim',
    config = function()
      vim.api.nvim_set_keymap('i', '<C-l>', 'copilot#Accept("")', {
        expr = true,
        silent = true,
        noremap = true,
      })
      vim.g.copilot_no_tab_map = true
    end,
  },

  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken',
    opts = {},
    vim.keymap.set('n', '<leader>cc', '<cmd>CopilotChatCommit<CR>'),
  },
}
