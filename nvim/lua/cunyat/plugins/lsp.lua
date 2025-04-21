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

        lspconfig.gopls.setup({ capabilities = capabilities })
        lspconfig.terraformls.setup({ capabilities = capabilities })
        lspconfig.tflint.setup({ capabilities = capabilities })
        lspconfig.nil_ls.setup({ capabilities = capabilities })
        lspconfig.phpactor.setup({ capabilities = capabilities })
        lspconfig.jsonnet_ls.setup({ capabilities = capabilities })
        lspconfig.rust_analyzer.setup({ capabilities = capabilities })
        lspconfig.clangd.setup({ capabilities = capabilities })
        lspconfig.dockerls.setup({ capabilities = capabilities })
        lspconfig.jdtls.setup({ capabilities = capabilities })
        lspconfig.yamlls.setup(yaml_companion)

        vim.g.zig_fmt_parse_errors = 0
        vim.g.zig_fmt_autosave = 0
        lspconfig.zls.setup({
            root_dir = lspconfig.util.root_pattern('.git', 'build.zig', 'zls.json'),
            settings = {
                zls = {
                    enable_inlay_hints = true,
                    enable_snippets = true,
                    warn_style = false,
                    enable_build_on_save = true,
                },
            },
        })

        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    runtime = { version = 'Lua 5.1' },
                    diagnostics = {
                        globals = { 'bit', 'vim', 'it', 'describe', 'before_each', 'after_each' },
                    }
                }
            }
        })

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
