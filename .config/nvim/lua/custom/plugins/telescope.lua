return {
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      local actions = require 'telescope.actions'
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
              ['<C-down>'] = actions.cycle_history_next,
              ['<C-up>'] = actions.cycle_history_prev,
            },
            n = {
              ['<CR>'] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },
      }
      local builtin = require 'telescope.builtin'
      local opts = { noremap = true }
      vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
      vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
      vim.keymap.set('n', '<leader>fg', require('telescope').extensions.live_grep_args.live_grep_args, opts)
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)
      vim.keymap.set('n', '<leader>fo', builtin.oldfiles, opts)
    end,
  },

  {
    'nvim-telescope/telescope-live-grep-args.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('telescope').load_extension 'live_grep_args'
    end,
  },

  {
    'debugloop/telescope-undo.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('telescope').load_extension 'undo'
      local opts = { noremap = true }
      vim.keymap.set('n', '<leader>u', '<cmd>Telescope undo<CR>', opts)
    end,
  },
}
