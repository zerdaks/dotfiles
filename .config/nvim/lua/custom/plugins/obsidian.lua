return {
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    lazy = true,
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      workspaces = {
        {
          name = 'personal',
          path = '~/Documents/repos/notes',
        },
        {
          name = 'work',
          path = '~/Documents/repos/work-notes',
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
  },
}
