local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'

local function single_or_multi_select(prompt_bufnr)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local num_selections = #picker:get_multi_selection()
  if num_selections > 1 then
    actions.send_selected_to_qflist(prompt_bufnr)
    vim.cmd.cfdo 'edit'
  else
    actions.file_edit(prompt_bufnr)
  end
end

return {
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('telescope').setup {
        defaults = {
          mappings = {
            i = {
              ['<C-up>'] = actions.cycle_history_prev,
              ['<C-down>'] = actions.cycle_history_next,
              ['<CR>'] = single_or_multi_select,
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
