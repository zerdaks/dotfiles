local config = {
  cmd = { '/opt/homebrew/Cellar/jdtls/1.37.0/bin/jdtls' },
  root_dir = require('jdtls.setup').find_root { '.git' },
}
require('jdtls').start_or_attach(config)
