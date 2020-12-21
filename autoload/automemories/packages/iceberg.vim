"=============================================================================
" FILE: iceberg.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" 🇦🇶 Bluish color scheme for Vim and Neovim
" https://github.com/cocopon/iceberg.vim
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#iceberg#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#iceberg#config()
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#iceberg#listener()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#iceberg#install(install)
  call a:install('cocopon/iceberg.vim')
endfunction
