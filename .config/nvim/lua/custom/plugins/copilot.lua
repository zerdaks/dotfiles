return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = '<C-l>',
            prev = '<C-k>',
            next = '<C-j>',
          },
        },
        filetypes = {
          markdown = true,
        },
      }
    end,
  },
}
