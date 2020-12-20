"=============================================================================
" FILE: vim_indentguides.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" Space indents are visually identified by the "┆" character, while tabs are distinguished by "|".
" https://github.com/thaerkh/vim-indentguides
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_indentguides#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_indentguides#config()
  let g:indentguides_ignorelist = ['text', 'help', 'nerdtree', 'startify']
  let g:indentguides_spacechar = '·'
  let g:indentguides_tabchar = '|'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_indentguides#listener()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_indentguides#install(install)
  call a:install('thaerkh/vim-indentguides')
endfunction
