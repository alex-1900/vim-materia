"=============================================================================
" FILE: vim_better_whitespace.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" This plugin causes all trailing whitespace characters to be highlighted. 
" https://github.com/ntpeters/vim-better-whitespace
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_better_whitespace#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_better_whitespace#config()
  let g:better_whitespace_enabled=1
  let g:strip_whitespace_on_save=1
  let g:better_whitespace_ctermcolor='yellow'
  let g:better_whitespace_guicolor='yellow'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_better_whitespace#listener()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_better_whitespace#install(install)
  call a:install('ntpeters/vim-better-whitespace')
endfunction
