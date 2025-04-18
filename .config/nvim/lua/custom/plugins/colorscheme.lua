return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme 'catppuccin'
    end,
  },

  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme 'gruvbox'
    end,
  },

  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'github_dark_colorblind'
    end,
  },

  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
}
