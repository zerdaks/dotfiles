return {
  'stevearc/conform.nvim',
  require('conform').setup {
    formatters_by_ft = {
      html = { 'prettier' },
      javascript = { 'prettier' },
      lua = { 'stylua' },
    },
  },
}
