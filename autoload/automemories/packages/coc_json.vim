"=============================================================================
" FILE: ccoc_jsonoc_html.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" https://github.com/neoclide/coc-json
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#coc_json#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#coc_json#config()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#coc_json#listener()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#coc_json#install(install)
  call a:install('neoclide/coc-json', { 'do': 'yarn install --frozen-lockfile' })
endfunction
