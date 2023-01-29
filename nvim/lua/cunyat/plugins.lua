local use = require("packer").use

return require("packer").startup(function()
    use { "wbthomason/packer.nvim" }

    -- LSP
    use { "folke/neodev.nvim" }
    use { "hrsh7th/nvim-cmp", config = [[require("cunyat.config.cmp")]] }
    use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }
    use { "neovim/nvim-lspconfig", after = "cmp-nvim-lsp", config = [[require("cunyat.config.lsp")]] }

    -- Visuals
    use { "vim-airline/vim-airline" }
    use { "vim-airline/vim-airline-themes" }
    use { "joshdick/onedark.vim" }
    use { "jiangmiao/auto-pairs" }
    use { "rebelot/kanagawa.nvim" }

    -- File searching & project navigation
    use {
        {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.1",
            requires = {
                "nvim-lua/plenary.nvim",
            },
            wants = {
                "popup.nvim",
                "plenary.nvim",
                "telescope-frecency.nvim",
                "telescope-fzf-native.nvim",
            },
            config = [[require("cunyat.config.telescope")]],
        }
        ,
        {
            "nvim-telescope/telescope-frecency.nvim",
            after = "telescope.nvim",
            requires = "tami5/sqlite.lua",
        },
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "make",
        },
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        requires = {
            "nvim-treesitter/nvim-treesitter-refactor",
            "RRethy/nvim-treesitter-textsubjects",
        },
        config = [[require("cunyat.config.treesitter")]],
        run = ":TSUpdate",
    }

    -- Git wrapper
    use { "tpope/vim-fugitive" }
    use { "airblade/vim-gitgutter" }

    -- Utilities
    use { "folke/which-key.nvim" }
    use { "karb94/neoscroll.nvim", config = [[require("cunyat.config.neoscroll")]] }
    use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }

end)
