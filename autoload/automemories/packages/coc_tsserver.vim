"=============================================================================
" FILE: coc_tsserver.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" https://github.com/neoclide/coc-tsserver
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#coc_tsserver#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#coc_tsserver#config()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#coc_tsserver#listener()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#coc_tsserver#install(install)
  call a:install('neoclide/coc-tsserver', { 'do': 'yarn install --frozen-lockfile' })
endfunction
