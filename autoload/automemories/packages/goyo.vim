"=============================================================================
" FILE: goyo.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" Distraction-free writing in Vim.
" https://github.com/junegunn/goyo.vim
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#goyo#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#goyo#config()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#goyo#listener()
  nnoremap gy :<C-u>Goyo<CR>
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#goyo#install(install)
  call a:install('junegunn/goyo.vim')
endfunction
