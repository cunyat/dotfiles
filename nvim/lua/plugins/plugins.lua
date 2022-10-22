-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function(use)
    
    -- Engine

    use {"hrsh7th/cmp-nvim-lsp"}
    use {"hrsh7th/cmp-path"}
    use {"hrsh7th/cmp-buffer"}
    use {"quangnguyen30192/cmp-nvim-ultisnips"}
   
    use {"hrsh7th/nvim-cmp" }
    
    -- nvim-lsp configuration (it relies on cmp-nvim-lsp, so it should be loaded after cmp-nvim-lsp).
    use { "neovim/nvim-lspconfig" }
    use {"onsails/lspkind-nvim" }
    
    -- Snippet engine and snippet template
    use {"SirVer/ultisnips", event = 'InsertEnter'}
    use {"honza/vim-snippets", after = 'ultisnips'}

    use 'wbthomason/packer.nvim'    
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'jiangmiao/auto-pairs'
    use 'joshdick/onedark.vim'
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    use 'tpope/vim-fugitive'
    use 'airblade/vim-gitgutter'
    use 'fatih/vim-go'
    use 'overcache/NeoSolarized'
    use 'vim-scripts/bash-support.vim'

    use {
        'folke/which-key.nvim',
        event = "VimEnter",
        config = function()
            vim.defer_fn(function() require('which-key') end, 2000)
        end
    }

    -- Smoothie motions
    use {
      "karb94/neoscroll.nvim",
      event = "VimEnter",
      config = function()
        vim.defer_fn(function() require('neoscroll') end, 2000)
      end
    }

end)

