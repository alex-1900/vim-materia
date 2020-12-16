"=============================================================================
" FILE: 00-settings-gui.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

if automemories#util#gui()
" begin of gui settings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => basic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" visually selecting text automatically places the text in the clipboard (register *) 
set guioptions+=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => features
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" close error bells
set noerrorbells
set novisualbell
set vb t_vb=
au GUIEnter * set t_vb=
" remove menu bar
set guioptions-=m
" remove toolbar
set guioptions-=T

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => colors and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" no toolbar
set lines=45
set columns=175
" set linespace=0

" end of gui settings
endif
