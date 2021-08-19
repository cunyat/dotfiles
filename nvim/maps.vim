let mapleader=" "

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
map <Leader>ob :Buffers<CR>

" faster scrolling
nnoremap <C-j> 10<C-e>
nnoremap <C-k> 10<C-y>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Show all diagnostics
nnoremap <silent> <Leader>ca  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <Leader>ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <Leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <Leader>co  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <Leader>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <Leader>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <Leader>ck  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <Leader>cp  :<C-u>CocListResume<CR>


