return {
  {
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
        auto_install = false, -- do not auto-install languages that are not installed
        ignore_install = { 'csv' }, -- rainbow_csv does not work if csv is installed
        highlight = { enable = true },
        indent = { enable = true },
      }
    end,
  },
}
