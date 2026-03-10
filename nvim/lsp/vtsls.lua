return {
  filetypes = {
    'vue',
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = {
          {
            name = '@vue/typescript-plugin',
            location = vim.fn.stdpath('config') .. '/node_modules/@vue/language-server',
            -- location = vim.fn.system({ 'nix', 'eval', 'nixpkgs#vue-language-server.outPath', '--raw' }),
            languages = { 'vue' },
            configNamespace = 'typescript',
          },
        },
      },
    },
  },
}
