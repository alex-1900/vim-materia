"=============================================================================
" FILE: vim_smooth_scroll.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" vim-smooth-scroll makes scrolling in Vim nice and smooth.
" https://github.com/terryma/vim-smooth-scroll
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_smooth_scroll#options()
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_smooth_scroll#config()
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_smooth_scroll#listener()
  noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 6, 1)<CR>
  noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 6, 1)<CR>
  noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 6, 1)<CR>
  noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 6, 1)<CR>
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_smooth_scroll#install(install)
  call a:install('terryma/vim-smooth-scroll')
endfunction
