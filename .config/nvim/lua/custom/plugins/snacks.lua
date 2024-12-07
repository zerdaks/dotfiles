return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      gitbrowse = { enabled = true },
      notifier = {
        enabled = true,
        timeout = 3000,
      },
      quickfile = { enabled = true },
      styles = {
        notification = {
          wo = { wrap = true },
        },
      },
    },

    vim.keymap.set('n', '<leader>gb', function()
      Snacks.gitbrowse()
    end),

    vim.keymap.set('v', '<leader>gb', function()
      Snacks.gitbrowse()
    end),

    vim.keymap.set('n', '<leader>nd', function()
      Snacks.notifier.hide()
    end),
  },
}
