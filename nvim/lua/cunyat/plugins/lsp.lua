return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'someone-stole-my-name/yaml-companion.nvim',
    {
      'stevearc/conform.nvim',
      opts = {
        formatters_by_ft = {},
        format_on_save = function(bufnr)
          -- Disable with a global or buffer-local variable
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          return { timeout_ms = 500, lsp_format = 'fallback' }
        end,
      },
    },
  },

  config = function()
    local blink = require('blink.cmp')
    local yaml_companion = require('yaml-companion').setup({
      builtin_matchers = { cloud_init = { enabled = false } },
    })

    local capabilities = blink.get_lsp_capabilities({}, true)

    vim.lsp.config('*', { capabilities = capabilities });
    vim.lsp.config('yamlls', yaml_companion);


    vim.lsp.enable('GitHub Copilot', false)
    vim.lsp.config('vtsls', {
      filetypes = {
        'vue', 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx'
      }
    });

    vim.lsp.enable({
      'phpactor', 'gopls', 'terraformls', 'tflint',
      'nil_ls', 'jsonnet_ls', 'rust_analyzer', 'clangd',
      'dockerls', 'jdtls', 'yamlls', 'zls', 'lua_ls',
      'vue_ls', 'vtsls', 'eslint',
    });

    vim.g.zig_fmt_parse_errors = 0
    vim.g.zig_fmt_autosave = 0

    vim.diagnostic.config({
      -- update_in_insert = true,
      float = {
        focusable = false,
        style = 'minimal',
        border = 'rounded',
        source = true,
        header = '',
        prefix = '',
      },
    })
  end
}
