-- Use a wildcard to find the jdtls executable
local handle = io.popen 'ls /opt/homebrew/Cellar/jdtls/*/bin/jdtls 2>/dev/null | head -n 1'
if not handle then
  error 'Could not find jdtls executable'
end

local jdtls_path = handle:read '*a'
handle:close()

-- Remove trailing whitespace characters
jdtls_path = jdtls_path:gsub('%s+', '')
if jdtls_path == '' then
  error 'Could not find jdtls executable'
end

-- Configure jdtls
local config = {
  cmd = { jdtls_path },
  root_dir = require('jdtls.setup').find_root { '.git' },
}
require('jdtls').start_or_attach(config)
