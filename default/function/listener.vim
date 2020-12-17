"=============================================================================
" FILE: listener.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

function! ListenerSessionLoad()
  " Load session for current path.
  call automemories#session#load_hash(getcwd())
endfunction

function! ListenerSessionSave()
  " Make session for current path.
  call automemories#session#save_hash(getcwd())
  echom 'Session saved.'
endfunction
