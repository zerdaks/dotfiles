return {
  'github/copilot.vim',
  config = function()
    vim.api.nvim_set_keymap('i', '<C-l>', 'copilot#Accept("")', {
      expr = true,
      silent = true,
      noremap = true,
    })
  end,
}
