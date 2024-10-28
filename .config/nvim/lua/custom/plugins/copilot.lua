return {
  {
    'zbirenbaum/copilot.lua',
    lazy = false,
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = '<C-l>',
          },
        },
        filetypes = {
          markdown = true,
          yaml = true,
        },
      }
    end,
  },
}
