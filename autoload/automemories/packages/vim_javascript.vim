"=============================================================================
" FILE: vim_javascript.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" JavaScript bundle for vim, this bundle provides syntax highlighting and improved indentation.
" https://github.com/pangloss/vim-javascript
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_javascript#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_javascript#config()
  let g:javascript_plugin_jsdoc = 1
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_javascript#listener()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_javascript#install(install)
  call a:install('pangloss/vim-javascript')
endfunction
