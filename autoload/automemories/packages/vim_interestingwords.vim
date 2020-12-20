"=============================================================================
" FILE: view.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" descripion
" https://github.com/URL
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_interestingwords#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_interestingwords#config()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_interestingwords#listener()
  " vim-interestingwords
  nnoremap <silent> <leader>k :call InterestingWords('n')<cr>
  vnoremap <silent> <leader>k :call InterestingWords('v')<cr>
  nnoremap <silent> <leader>K :call UncolorAllWords()<cr>
  nnoremap <silent> n :call WordNavigation(1)<cr>
  nnoremap <silent> N :call WordNavigation(0)<cr>
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_interestingwords#install(install)
  call a:install('lfv89/vim-interestingwords')
endfunction
