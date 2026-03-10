return {
  -- root_dir = require('lspconfig.util').root_pattern('.git', 'build.zig', 'zls.json'),
  settings = {
    zls = {
      enable_inlay_hints = true,
      enable_snippets = true,
      warn_style = false,
      enable_build_on_save = true,
    },
  },
}
