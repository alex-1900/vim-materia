"=============================================================================
" FILE: functions.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

function! materia#common#functions#get() abort
  " return 1 if plug exist
  function! HasPlug(name)
    return isdirectory(g:materia#path#bundles . '/' . a:name)
  endfunction
  
  let s:lkey = '<leader>'
  let s:akey = materia#conf('options.maps.action')
  let s:lakey = materia#conf('options.maps.localaction')
  let s:gkey = materia#conf('options.maps.navigation')
  let s:ekey = materia#conf('options.maps.edge')
  let s:nkey = materia#conf('options.maps.next')
  let s:pkey = materia#conf('options.maps.prev')
  function! GetConfigMapPrefix(okey) abort
    return {
      \ 'view': s:lkey . a:okey,
      \ 'action': s:akey . a:okey,
      \ 'localaction': s:lakey,
      \ 'nav': s:gkey . a:okey,
      \ 'win': '<C-' . a:okey. '>',
      \ 'edge': s:ekey . a:okey,
      \ 'next': s:nkey . a:okey,
      \ 'prev': s:pkey . a:okey
    \ }
  endfunction
endfunction
