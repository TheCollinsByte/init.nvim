local jdtls = require('jdtls')

local root_markers = { 'build.gradle', 'settings.gradle', '.git' }
local root_dir = require('jdtls.setup').find_root(root_markers)

local workspace_dir = '/home/collo/.local/share/eclipse/' .. vim.fn.fnamemodify(root_dir, ':p:h:t')

local config = {
  cmd = {
    'java-lsp.sh',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '-jar', '/path/to/jdtls/plugins/org.eclipse.equinox.launcher_1.x.x.vYYYYMMDD.jar',
    '-configuration', '/path/to/jdtls/config_linux',
    '-data', '/path/to/workspace/folder',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
  },
  root_dir = root_dir,
  workspace_folder = workspace_dir,
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "Java-17",
            path = "/usr/lib/jvm/java-17-openjdk",
          },
        },
      },
    },
  },
  init_options = {
    bundles = {},
  },
}

-- Attach or start the language server
jdtls.start_or_attach(config)

