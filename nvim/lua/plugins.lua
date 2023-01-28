local use = require("packer").use

return require("packer").startup(function()
    use { "wbthomason/packer.nvim" }

    -- LSP
    use { "folke/neodev.nvim" }

    use { "neovim/nvim-lspconfig", config = [[require("config.lsp")]] }
    use { "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-nvim-lsp" }

    -- Visuals
    use { "vim-airline/vim-airline" }
    use { "vim-airline/vim-airline-themes" }
    use { "joshdick/onedark.vim" }
    use { "jiangmiao/auto-pairs" }
    use { "rebelot/kanagawa.nvim" }

    -- Serching with fzf
    use { "junegunn/fzf" }
    use { "junegunn/fzf.vim" }

    -- Git wrapper
    use { "tpope/vim-fugitive" }
    use { "airblade/vim-gitgutter" }

    -- Utilities
    use { "folke/which-key.nvim" }
    use { "karb94/neoscroll.nvim", config = [[require("config.neoscroll")]] }

end)
