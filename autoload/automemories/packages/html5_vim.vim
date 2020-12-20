"=============================================================================
" FILE: html5_vim.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" HTML5 + inline SVG omnicomplete function, indent and syntax for Vim. Based on the default htmlcomplete.vim.
" https://github.com/othree/html5.vim
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#html5_vim#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#html5_vim#config()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#html5_vim#listener()
  autocmd FileType html,css EmmetInstall
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#html5_vim#install(install)
  call a:install('othree/html5.vim')
endfunction
