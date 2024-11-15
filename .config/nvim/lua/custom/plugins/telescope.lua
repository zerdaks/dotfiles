return {
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      local actions = require 'telescope.actions'
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-up>'] = actions.cycle_history_prev,
              ['<C-down>'] = actions.cycle_history_next,
              ['<CR>'] = function(p_bufnr)
                actions.send_selected_to_qflist(p_bufnr)
                vim.cmd.cfdo 'edit'
              end,
            },
          },
        },
      }

      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>fb', builtin.buffers)
      vim.keymap.set('n', '<leader>ff', builtin.find_files)
      vim.keymap.set('n', '<leader>fg', builtin.live_grep)
      vim.keymap.set('n', '<leader>fh', builtin.help_tags)
      vim.keymap.set('n', '<leader>fo', builtin.oldfiles)
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
      vim.keymap.set('n', '<leader>u', '<cmd>Telescope undo<CR>')
    end,
  },
}
