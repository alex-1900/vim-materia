"=============================================================================
" FILE: 01-autocmd.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

augroup automemories
autocmd!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => edit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for scss files
autocmd FileType scss setl iskeyword+=@-@


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if automemories#platform#gui()
" begin of gui settings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => features
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Properly disable sound on errors on MacVim
if has("gui_macvim")
  autocmd GUIEnter * set vb t_vb=
endif

" end of gui settings
endif

augroup EN
