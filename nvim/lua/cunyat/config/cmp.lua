vim.opt.completeopt = "menu,menuone,noselect"

local cmp = require "cmp"
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
            if cmp.visible() then
                local entry = cmp.get_selected_entry()
                if not entry then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                else
                    cmp.confirm()
                end
            else
                fallback()
            end
        end, { "i", "s", }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" }
    }, {
        { name = "buffer" }
    }),
})

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
