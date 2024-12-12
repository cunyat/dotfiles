return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function(plugin, opts)
            opts.flavor = 'mocha'
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme('catppuccin')
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {
            options = {
                icons_enabled = true,
                section_separators = "",
                component_separators = "|",
            }
        },
    },
}
