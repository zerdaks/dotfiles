return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('bufferline').setup {
        options = {
          always_show_bufferline = false,
        },
      }
    end,
  },

  {
    'debugloop/telescope-undo.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('telescope').load_extension('undo')
      local opts = { noremap = true }
      vim.keymap.set('n', '<leader>u', '<cmd>Telescope undo<CR>', opts)
    end,
  },

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
          path = '~/Documents/repos/fc-notes',
        },
      },
      follow_url_func = function(url)
        vim.fn.jobstart({ 'open', url })
      end,
      open_app_foreground = true,
    },
  },

  {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    config = function()
      require('telescope').load_extension('noice')
      require('noice').setup({
        routes = {
          -- show @recording messages as notifications
          {
            filter = {
              event = 'msg_showmode',
            },
            view = 'notify',
          },
        },
      })
      local opts = { noremap = true }
      vim.keymap.set('n', '<leader>nd', '<cmd>NoiceDismiss<CR>', opts)
    end,
  },

  {
    'folke/twilight.nvim',
    config = function()
      require('twilight').setup {
        dimming = {
          alpha = 0.35,
        },
        context = 20,
      }
      local opts = { noremap = true }
      vim.keymap.set('n', '<leader>t', '<cmd>Twilight<CR>', opts)
      require('twilight').enable() -- enable twilight on startup
    end,
  },

  {
    'ggandor/leap.nvim',
    config = function()
      require('leap').set_default_keymaps(true)
    end,
  },

  {
    'lervag/vimtex',
    config = function()
      local opts = { noremap = true }
      vim.keymap.set('n', '<leader><CR>', '<cmd>VimtexCompile<CR>', opts)
    end,
  },

  {
    'mechatroner/rainbow_csv',
    lazy = true,
    ft = 'csv',
  },

  {
    'mfussenegger/nvim-jdtls',
  },

  {
    'nvim-telescope/telescope-live-grep-args.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('telescope').load_extension('live_grep_args')
    end,
  },

  {
    'nvim-telescope/telescope.nvim',
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', 'fo', builtin.oldfiles, {})
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    end
  },

  {
    'stevearc/oil.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('oil').setup({
        default_file_explorer = false, -- enable Netrw to fix GBrowse
        view_options = {
          show_hidden = true,
        },
      })
      local opts = { noremap = true }
      vim.keymap.set('n', '<C-f>', '<cmd>Oil<CR>', opts)
    end,
  },

  {
    'tpope/vim-fugitive',
    config = function()
      local opts = { noremap = true }
      vim.keymap.set('n', '<leader>g', '<cmd>vertical rightbelow Git<CR>', opts)
    end,
  },

  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  },

  {
    'zbirenbaum/copilot.lua',
    cmd ='Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = '<C-l>',
            next = '<C-j>',
            previous = '<C-k>',
            dismiss = '<esc>',
          },
        },
        filetypes = {
          markdown = true,
        },
      }
    end,
  },

  -- THEMES

  {
    'craftzdog/solarized-osaka.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme 'solarized-osaka'
    end,
  },

  {
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('gruvbox').setup {
        bold = false,
        contrast = 'hard',
      }
      vim.cmd.colorscheme 'gruvbox'
    end,
  },

  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup({
        style = 'moon',
      })
      -- vim.cmd.colorscheme 'tokyonight'
    end,
  },
}
