
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Backspace works as expected (across lines)
set backspace=indent,eol,start

" lua require('.plugins')
luafile $HOME/.config/nvim/lua/init.lua

syntax on

" set backgrounds
set background=light
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

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
set shiftwidth=4            " width for autoindents

set wildmode=longest,list   " get bash-like tab completions
set completeopt=menuone,noselect 	" Completion Preview
set mouse+=a                      	" Don't select/copy line numbers

set termguicolors

set nobackup
set noswapfile
set undofile

set expandtab                     	" Use spaces, not tabs
set shiftround                      " Round indent to multiple of 'shiftwidth'
set smartindent                     " Do smart indenting when starting a new line
set autoindent                      " Copy indent from current line, over to the new line

filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting

" Searching behaves like a web browser
set incsearch ignorecase smartcase hlsearch

so ~/.config/nvim/maps.vim

" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_fmt_autosave = 1
let g:go_rename_command="gopls"
let g:go_gopls_enabled = 0

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1


" fzf plugin settings
let g:fzf_action = { 'ctrl-s': 'split', 'ctrl-v': 'vsplit' }
let g:fzf_preview_window = 'right:40%'

augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END


