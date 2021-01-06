"=============================================================================
" FILE: autocmds.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

function! materia#common#autocmds#get()
  " Run PlugInstall if there are missing plugins on events stabilize.
  let l:last_event = 'VimEnter *'
  if has_key(materia#conf('parts'), 'materia_session') && HasPlug('vim-materia-session')
    let l:last_event = 'User MateriaSessionLoaded'
  endif
  execute 'autocmd '. l:last_event ." if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))"
    \ "| PlugInstall"
  \ "| endif"
endfunction
