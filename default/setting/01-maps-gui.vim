"=============================================================================
" FILE: 01-gui-settings.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

if automemories#util#is_gui()
" begin of gui settings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => features
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle menu bar and tabbar
map <silent> <F6> :if &guioptions =~# 'T' <Bar>
    \ set guioptions-=T <Bar>
    \ set guioptions-=m <bar>
  \ else <Bar>
    \ set guioptions+=T <Bar>
    \ set guioptions+=m <Bar>
  \ endif<CR>

" end of gui settings
endif
