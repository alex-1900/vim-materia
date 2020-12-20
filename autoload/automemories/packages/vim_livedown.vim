"=============================================================================
" FILE: vim_livedown.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" https://github.com/neoclide/coc-json
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_livedown#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_livedown#config()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_livedown#listener()
  nnoremap <silent> <leader>ml <C-u>:LivedownToggle<CR>
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_livedown#install(install)
  call a:install('shime/vim-livedown', { 'do': 'yarn global add livedown' })
endfunction
