-- Mason comes from Kickstart, whose init.lua installs only its own servers.
-- Tools only Neovim uses are installed here; shell tools come from the justfile.
local registry = require 'mason-registry'

registry.refresh(function()
  for _, name in ipairs {
    'buf', -- conform.nvim: proto
    'copilot-language-server', -- options.lua
    'goimports', -- conform.nvim: go
    'jdtls', -- ftplugin/java.lua
    'prettier', -- conform.nvim: css, html, javascript, typescript
    'shfmt', -- conform.nvim: bash, sh
    'sql-formatter', -- conform.nvim: sql
  } do
    local pkg = registry.get_package(name)
    if not pkg:is_installed() and not pkg:is_installing() then
      pkg:install()
    end
  end
end)
