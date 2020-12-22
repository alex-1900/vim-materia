"=============================================================================
" FILE: supertab.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" Supertab is a vim plugin which allows you to use <Tab> for all your insert completion needs (:help ins-completion).
" https://github.com/ervandew/supertab
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#supertab#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#supertab#config()
  let g:SuperTabDefaultCompletionType = "<c-n>"
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#supertab#listener()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#supertab#install(install)
  call a:install('ervandew/supertab')
endfunction
