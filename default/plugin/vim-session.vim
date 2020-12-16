"=============================================================================
" FILE: vim-session.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" Extended session management for Vim
" https://github.com/xolox/vim-session
"
" https://stackoverflow.com/questions/5142099/how-to-auto-save-vim-session-on-quit-and-auto-reload-on-start-including-split-wi
"=============================================================================

let g:session_directory = automemories#homepath('/sessions')
let g:session_autosave = 'no'
let g:session_lock_enabled = 0
let g:session_autoload = 'no'
let g:session_default_to_last = 1
let g:session_default_overwrite = 1
let g:session_persist_colors = 0
let g:session_menu = 0

function s:save_session_with_current_path()
  let s:name = md5#md5(getcwd())
  execute ':SaveSession' s:name
endfunction

function s:open_session_with_current_path()
  let g:aaaname = md5#md5(getcwd())
  if filereadable(automemories#homepath('/sessions/' . g:aaaname . '.vim'))
    execute 'OpenSession' g:aaaname
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function ListenerPlugLoadVimSession()
  if HasPlug('vim-session')
    call s:open_session_with_current_path()
  endif
endfunction

function ListenerVimLeaveVimSession()
  if HasPlug('vim-session')
    call s:save_session_with_current_path()
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => trigger
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PlugOptionDoVimSession(info = {})
  call ListenerPlugLoadVimSession()
  call ListenerVimLeaveVimSession()
endfunction

Plug 'xolox/vim-misc'
\| Plug 'xolox/vim-session', { 'do': function('PlugOptionDoVimSession') }
