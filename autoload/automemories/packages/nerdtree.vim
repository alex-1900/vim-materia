"=============================================================================
" FILE: nerdtree.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" The NERDTree is a file system explorer for the Vim editor.
" https://github.com/preservim/nerdtree
" https://github.com/PhilRunninger/nerdtree-visual-selection
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

  let g:NERDTreeDirArrowExpandable = '▸'
  let g:NERDTreeDirArrowCollapsible = '▾'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#nerdtree#listener()
  nnoremap <silent> <leader>b :NERDTreeToggle<CR>
  " nnoremap <silent> <leader>bf <C-u>:NERDTreeFind<CR>
  " nnoremap <silent> <leader>bn <C-u>:NERDTreeFocus<CR>
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#nerdtree#install(install)
  call a:install('preservim/nerdtree')
  call a:install('PhilRunninger/nerdtree-visual-selection')
endfunction
