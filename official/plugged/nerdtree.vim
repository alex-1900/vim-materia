"=============================================================================
" FILE: nerdtree.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" The NERDTree is a file system explorer for the Vim editor.
" https://github.com/preservim/nerdtree
"=============================================================================

let g:NERDTreeAutoCenter=1
let g:NERDTreeShowBookmarks=1
let g:NERDTreeWinPos="dark"
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeAutoCenter=1
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeShowFiles = 1

function! ListenerPlugLoadedNerdtree(info = {})
  nnoremap <leader>t :NERDTreeToggle<CR>
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endfunction

Plug 'preservim/nerdtree', { 'do': function('ListenerPlugLoadedNerdtree') }
