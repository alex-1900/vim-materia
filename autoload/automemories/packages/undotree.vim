"=============================================================================
" FILE: panel.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" The plug-in visualizes undo history and makes it easier to browse and switch between different undo branches
" https://github.com/mbbill/undotree
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#undotree#options()
  if has("persistent_undo")
    set undodir=automemories#homepath("/.undodir")
    set undofile
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#undotree#config()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#undotree#listener()
  nnoremap <leader>u :UndotreeToggle<CR>
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#undotree#install(install)
  call a:install('mbbill/undotree')
endfunction
