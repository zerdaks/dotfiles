local config = {
  cmd = { vim.fn.expand '~/.local/share/nvim/mason/bin/jdtls' },
  root_dir = require('jdtls.setup').find_root { '.git', 'pom.xml', 'build.gradle', 'build.gradle.kts' },
}
require('jdtls').start_or_attach(config)
