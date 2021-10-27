call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'overcache/NeoSolarized'

call plug#end()

syntax on

" set backgrounds
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
colorscheme NeoSolarized
let g:airline_theme='solarized'

" add line numbers
set number
set relativenumber

set noshowmode
set ruler
set encoding=utf-8
set cursorline
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=v                 " middle-click paste with mouse
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents

set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting

" Backspace works as expected (across lines)
set backspace=indent,eol,start

" Searching behaves like a web browser
set incsearch ignorecase smartcase hlsearch

so ~/.config/nvim/maps.vim


" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=1
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0


" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_fmt_autosave = 1
let g:go_rename_command="gopls"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }
let g:fzf_preview_window = 'right:40%'

augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END

