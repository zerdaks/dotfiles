return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      html = { 'prettier' },
      javascript = { 'prettier' },
      lua = { 'stylua' },
      typescript = { 'prettier' },
      ruby = { 'rubocop' },
    },
  },
}
