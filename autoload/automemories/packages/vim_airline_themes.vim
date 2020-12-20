"=============================================================================
" FILE: vim_airline_themes.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" Lean & mean status/tabline for vim that's light as air.
" https://github.com/vim-airline/vim-airline
" https://github.com/vim-airline/vim-airline-themes
" https://github.com/vim-airline/vim-airline/wiki/FAQ
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_airline_themes#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_airline_themes#config()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_airline_themes#listener()
  call airline#switch_theme('deus')
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_airline_themes#install(install)
  call a:install('vim-airline/vim-airline-themes')
endfunction
