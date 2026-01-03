return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      bash = { 'shfmt' },
      css = { 'prettier' },
      go = { 'gofmt', 'goimports' },
      html = { 'prettier' },
      javascript = { 'prettier' },
      lua = { 'stylua' },
      proto = { 'buf' },
      ruby = { 'rubocop' },
      sh = { 'shfmt' },
      sql = { 'sql_formatter' },
      typescript = { 'prettier' },
    },
  },
}
