let mapleader=","

" Disable arrow keys; hjkl are way better anyways!
noremap  <up>    <nop>
inoremap <up>    <nop>
noremap  <down>  <nop>
inoremap <down>  <nop>
noremap  <left>  <nop>
inoremap <left>  <nop>
noremap  <right> <nop>
inoremap <right> <nop>

" Press escape to exit terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

" split resize
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><

" save faster :)
nnoremap <Leader>w :w<CR>

" fzf
map <Leader>p :GFiles<CR>
map <Leader>P :Files<CR>
map <Leader>k :Ag<CR>
map <Leader>b :Buffers<CR>

" faster scrolling
nnoremap <C-j> 10<C-e>
nnoremap <C-k> 10<C-y>

