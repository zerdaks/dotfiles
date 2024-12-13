return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      gitbrowse = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
    keys = {
      {
        '<leader>gb',
        function()
          Snacks.gitbrowse()
        end,
      },
      {
        '<leader>nd',
        function()
          Snacks.notifier.hide()
        end,
      },
    },

    vim.keymap.set('v', '<leader>gb', function()
      require('snacks').gitbrowse()
    end),
  },
}
