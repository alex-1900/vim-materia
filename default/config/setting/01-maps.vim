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
nnoremap <C-h> :bp!<CR>
nnoremap <C-l> :bn!<CR>
nnoremap <C-d> :bd<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle hlsearch
nnoremap <F8> :set hlsearch! hlsearch?<CR>
" pressing meta-f will highlight all occurrences of the current word
nnoremap <leader>hf :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hlsearch<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

