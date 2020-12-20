"=============================================================================
" FILE: 01-gui-settings.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => features
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap vv <ESC>

" goto or remove buffer
nnoremap gp :bp!<CR>
nnoremap gn :bn!<CR>
nnoremap <C-x> :bd<CR>
" move to another window
nnoremap <leader>ws :sp<CR>
nnoremap <leader>wv :vsp<CR>
nnoremap <leader>wh <C-w>h
nnoremap <leader>wl <C-w>l
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>ww <C-w>w
nnoremap <leader>wq :close<CR>

" mutiple lines
nnoremap <C-e> 4<C-e>
nnoremap <C-y> 4<C-y>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" save current buffer
inoremap <M-w> <ESC>:w<CR>:startinsert<CR>
nnoremap<M-w> :w<CR>
