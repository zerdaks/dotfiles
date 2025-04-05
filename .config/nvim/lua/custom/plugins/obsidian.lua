return {
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
        name = 'doc-notes',
        path = '~/Documents/repos/notes',
      },
      {
        name = 'work-notes',
        path = '~/Documents/repos/work-notes',
      },
      {
        name = 'down-notes',
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
