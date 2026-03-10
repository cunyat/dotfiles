return {
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    lazy = false,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
    },
    opts = function()
      return {
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
        pickers = {
          find_files = {
            find_command = {
              'fd', '--type', 'f', '--color', 'never',
              '--no-ignore', '--hidden', '--exclude', 'vendor/',
              '--exclude', '.git/', '--exclude', 'var/',
              '--exclude', 'node_modules/',
            },
          }
        },
        extensions = {
          fzf = {
            fuzzy = false,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          },
          ["zf-native"] = {
            file = {
              enable = true,
              highlight_results = true,
              match_filename = true,
              initial_sort = nil,
              smart_case = true,
            },
            generic = { enable = false },
          },
          ["ui-select"] = {
            require("telescope.themes").get_dropdown()
          }
        }
      }
    end,
  },
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
  {
    'natecraddock/telescope-zf-native.nvim',
    config = function()
      require('telescope').load_extension('zf-native')
    end
  },
}
