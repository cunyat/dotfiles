return {
    'nvim-telescope/telescope.nvim',
    opts = {
        defaults = {
            mappings = {
                i = {
                    ['<C-u>'] = false,
                    ['<C-d>'] = false,
                },
            },
            layout_strategy = 'vertical',
            layout_config = {
                vertical = {
                    height = 0.95,
                    width = 0.95,
                    prompt_position = 'top',
                    mirror = true,
                    preview_height = 0.6,
                    preview_cutoff = 0,
                },
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = 'smart_case',
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
