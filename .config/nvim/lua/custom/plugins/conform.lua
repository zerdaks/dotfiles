return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      bash = { 'shfmt' },
      go = { 'gofmt', 'goimports' },
      html = { 'prettier' },
      javascript = { 'prettier' },
      lua = { 'stylua' },
      typescript = { 'prettier' },
      ruby = { 'rubocop' },
      sh = { 'shfmt' },
    },
  },
}
