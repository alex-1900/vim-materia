"=============================================================================
" FILE: vim_easy_align.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" A simple, easy-to-use Vim alignment plugin.
" https://github.com/junegunn/vim-easy-align
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_easy_align#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_easy_align#config()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_easy_align#listener()
  " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_easy_align#install(install)
  call a:install('junegunn/vim-easy-align')
endfunction
