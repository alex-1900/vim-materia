"=============================================================================
" FILE: nerdtree.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" The NERDTree is a file system explorer for the Vim editor.
" https://github.com/preservim/nerdtree
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#nerdtree#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#nerdtree#config()
  let g:NERDTreeAutoCenter=1
  let g:NERDTreeShowBookmarks=1
  " let g:NERDTreeWinPos="dark"
  let g:NERDTreeShowLineNumbers=1
  let g:NERDTreeAutoCenter=1
  let g:NERDTreeHighlightCursorline = 1
  let g:NERDTreeShowFiles = 1
  " avoid crashes when calling vim-plug functions while the cursor is on the NERDTree window
  let g:plug_window = 'noautocmd vertical topleft new'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#nerdtree#listener()
  nnoremap <silent> <F3> :<C-u>:NERDTreeToggle<CR>
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#nerdtree#install(install)
  call a:install('preservim/nerdtree')
endfunction
