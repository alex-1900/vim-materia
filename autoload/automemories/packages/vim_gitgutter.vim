"=============================================================================
" FILE: vim_gitgutter.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" A Vim plugin which shows a git diff in the sign column.
" https://github.com/airblade/vim-gitgutter
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_gitgutter#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_gitgutter#config()
  let g:gitgutter_max_signs = -1
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_gitgutter#listener()
  highlight! link SignColumn LineNr 
  " nmap ]h <Plug>(GitGutterNextHunk)
  " nmap [h <Plug>(GitGutterPrevHunk)
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_gitgutter#install(install)
  call a:install('airblade/vim-gitgutter')
endfunction
