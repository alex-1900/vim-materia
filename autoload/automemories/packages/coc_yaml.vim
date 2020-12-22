"=============================================================================
" FILE: coc_yaml.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" Yaml language server extension for coc.nvim
" https://github.com/neoclide/coc-yaml
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#coc_yaml#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#coc_yaml#config()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#coc_yaml#listener()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#coc_yaml#install(install)
  call a:install('neoclide/coc-yaml', { 'do': 'yarn install --frozen-lockfile' })
endfunction
