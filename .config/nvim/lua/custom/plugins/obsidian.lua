return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'hrsh7th/nvim-cmp',
      config = function()
        local cmp = require 'cmp'
        cmp.setup {
          mapping = {
            ['<Down>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
            ['<Up>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
            ['<C-y>'] = cmp.mapping.confirm { select = true },
          },
          sources = {
            { name = 'nvim_lsp' },
            { name = 'buffer' },
          },
        }
      end,
    },
  },
  opts = {
    workspaces = {
      {
        name = 'my-notes',
        path = '~/Documents/repos/notes',
      },
      {
        name = 'other-notes',
        path = '~/Downloads/notes',
      },
    },

    disable_frontmatter = false,

    templates = {
      folder = 'templates',
      date_format = '%Y-%m-%d',
      time_format = '%H:%M',
    },

    follow_url_func = function(url)
      vim.fn.jobstart { 'open', url }
    end,

    open_app_foreground = true,
  },
}
