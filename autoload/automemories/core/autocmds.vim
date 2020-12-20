"=============================================================================
" FILE: autocmds.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

function! automemories#core#autocmds#get()
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
endfunction
