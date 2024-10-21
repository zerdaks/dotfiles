return {
  { -- bufferline - buffer tab manager
    'akinsho/bufferline.nvim',
    -- version = '*',
    branch = 'main',
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

  { -- catppuccin - theme
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha', -- latte, frappe, macchiato, mocha
      }
      -- vim.cmd.colorscheme 'catppuccin'
    end,
  },

  { -- copilot - Copilot integration
    'zbirenbaum/copilot.lua',
    lazy = false,
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = '<C-l>',
          },
        },
        filetypes = {
          markdown = true,
          yaml = true,
        },
      }
    end,
  },

  { -- gitlinker - Git URL generator
    'ruifm/gitlinker.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('gitlinker').setup {}
    end,
  },

  { -- gruvbox - theme
    'ellisonleao/gruvbox.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('gruvbox').setup {
        bold = false,
        contrast = 'hard',
      }
      -- vim.cmd.colorscheme 'gruvbox'
    end,
  },

  { -- leap - fast navigation
    'ggandor/leap.nvim',
    config = function()
      require('leap').set_default_keymaps(true)
    end,
  },

  { -- neogit - git client
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('neogit').setup {}
      local opts = { noremap = true }
      vim.keymap.set('n', '<leader>ng', '<cmd>Neogit<CR>', opts)
    end,
  },

  { -- noice (folke) - message notifications
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    config = function()
      require('telescope').load_extension 'noice'
      require('noice').setup {
        routes = {
          -- show @recording messages as notifications
          {
            filter = {
              event = 'msg_showmode',
            },
            view = 'notify',
          },
        },
      }
      local opts = { noremap = true }
      vim.keymap.set('n', '<leader>nd', '<cmd>NoiceDismiss<CR>', opts)
    end,
  },

  { -- nvim-autopairs - auto-closing pairs
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  },

  { -- nvim-jdtls - Java LSP
    'mfussenegger/nvim-jdtls',
    config = function()
      local opts = { noremap = true }
      vim.keymap.set('n', '<leader>i', '<cmd>lua require"jdtls".organize_imports()<CR>', opts)
    end,
  },

  { -- obsidian - Obsidian integration
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
      follow_url_func = function(url)
        vim.fn.jobstart { 'open', url }
      end,
      open_app_foreground = true,
    },
  },

  { -- oil - file explorer
    'stevearc/oil.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('oil').setup {
        view_options = {
          show_hidden = true,
        },
      }
      local opts = { noremap = true }
      vim.keymap.set('n', '-', '<cmd>Oil<CR>', opts)
    end,
  },

  { -- outline - code outline viewer
    'hedyhli/outline.nvim',
    lazy = true,
    cmd = { 'Outline', 'OutlineOpen' },
    keys = {
      {
        '<leader>o',
        '<cmd>OutlineOpen<CR>',
        desc = 'Toggle outline',
      },
    },
    config = function()
      require('outline').setup {}
    end,
  },

  { -- rainbow_csv - CSV syntax highlighting
    'mechatroner/rainbow_csv',
    lazy = true,
    ft = 'csv',
  },

  { -- solarized-osaka - theme
    {
      'craftzdog/solarized-osaka.nvim',
      lazy = false,
      priority = 1000,
      config = function()
        vim.cmd.colorscheme 'solarized-osaka'
      end,
    },
  },

  { -- telescope - fuzzy finder
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

  { -- telescope-live-grep-args - live grep integration
    'nvim-telescope/telescope-live-grep-args.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require('telescope').load_extension 'live_grep_args'
    end,
  },

  { -- telescope-undo - undo history viewer
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

  { -- treesitter - syntax highlighting
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'bash',
          'css',
          'fish',
          'git_config',
          'gitignore',
          'go',
          'html',
          'java',
          'javascript',
          'json',
          'lua',
          'make',
          'markdown',
          'markdown_inline',
          'php',
          'ruby',
          'sql',
          'vim',
          'vimdoc',
          'yaml',
        },
        auto_install = false,
        ignore_install = { 'csv' }, -- rainbow_csv does not work if csv is installed
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },

  { -- twilight (folke) - dim inactive code
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
      require('twilight').enable() -- enable on startup
    end,
  },

  { -- vimtex - LaTeX support
    'lervag/vimtex',
  },
}
