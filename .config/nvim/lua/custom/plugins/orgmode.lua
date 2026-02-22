return {
  {
    'nvim-orgmode/orgmode',
    dependencies = {
      {
        'nvim-orgmode/org-bullets.nvim',
      },
    },
    event = 'VeryLazy',
    config = function()
      require('orgmode').setup {
        org_agenda_files = '~/orgfiles/**/*',
        org_default_notes_file = '~/orgfiles/refile.org',
      }
      require('org-bullets').setup()
      vim.lsp.enable 'org'
    end,
  },
  {
    'chipsenkbeil/org-roam.nvim',
    tag = '0.2.0',
    dependencies = {
      {
        'nvim-orgmode/orgmode',
        tag = '0.7.0',
      },
    },
    config = function()
      require('org-roam').setup {
        directory = '~/orgfiles',
      }
    end,
  },
}
