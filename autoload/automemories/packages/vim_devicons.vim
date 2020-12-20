"=============================================================================
" FILE: airline.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" Adds filetype glyphs (icons) to various vim plugins.
" https://github.com/ryanoasis/vim-devicons
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_devicons#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_devicons#config()
  let app_system = automemories#dependence#get('app#system')
  let g:webdevicons_enable = 1
  if !app_system.is_gui
    let g:webdevicons_enable = 0
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_devicons#listener()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_devicons#install(install)
  call a:install('ryanoasis/vim-devicons')
endfunction
