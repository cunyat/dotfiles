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
        local lspconfig = require('lspconfig')
        local yaml_companion = require('yaml-companion').setup({
            builtin_matchers = { cloud_init = { enabled = false } },
        })

        local capabilities = vim.tbl_deep_extend(
            'force',
            {},
            vim.lsp.protocol.make_client_capabilities(),
            blink.get_lsp_capabilities()
        )

        vim.lsp.config('*', { capabilities = capabilities });
        vim.lsp.config('yamlls', yaml_companion);
        vim.lsp.config('zls', {
            root_dir = lspconfig.util.root_pattern('.git', 'build.zig', 'zls.json'),
            capabilities = capabilities,
            settings = {
                zls = {
                    enable_inlay_hints = true,
                    enable_snippets = true,
                    warn_style = false,
                    enable_build_on_save = true,
                },
            },
        })
        vim.lsp.config('lua_ls', {
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = { version = 'Lua 5.3' },
                    diagnostics = { globals = { 'vim' } }
                }
            }
        })

        vim.lsp.enable({ 'phpactor', 'gopls', 'terraformls', 'tflint', 'nil_ls', 'jsonnet_ls', 'rust_analyzer', 'clangd',
            'dockerls', 'jdtls', 'yamlls', 'zls', 'lua_ls' });

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
