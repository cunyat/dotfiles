return {
    'nvim-telescope/telescope.nvim',
    opts = {
        defaults = require('telescope.themes').get_ivy({
            mappings = {
                i = {
                    ['<C-u>'] = false,
                    ['<C-d>'] = false,
                },
            },
            layout_config = {
                height = 0.35
            }
        }),
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = 'smart_case',
            },
            ["ui-select"] = {
                require("telescope.themes").get_dropdown({})
            }
        }
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-ui-select.nvim',
            config = function()
                require('telescope').load_extension('ui-select')
            end
        },
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            config = function()
                require('telescope').load_extension('fzf')
            end
        },
    },
}
