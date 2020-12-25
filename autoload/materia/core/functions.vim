"=============================================================================
" FILE: functions.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

function! materia#core#functions#get()
  " return 1 if plug exist
  function! HasPlug(name)
    if exists('g:loaded_plug')
      return isdirectory(g:materia#path#bundles . '/' . a:name)
    endif
    return 0
  endfunction
  " Load
endfunction
