"=============================================================================
" FILE: fzf.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" https://github.com/junegunn/fzf
" https://github.com/ggreer/the_silver_searcher
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#fzf#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#fzf#config()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#fzf#listener()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#fzf#install(install)
  call a:install('junegunn/fzf', { 'do': 'call fzf#install()' })
endfunction
