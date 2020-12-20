"=============================================================================
" FILE: 01-autocmd.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim enter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" augroup am_vim_enter
"   autocmd!
"   autocmd VimEnter * nested call ListenerSessionLoad()
" augroup end

" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => vim leave pre
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" augroup am_vim_leave_pre
"   autocmd!
"   autocmd VimLeavePre * nested call ListenerSessionSave()
" augroup end
