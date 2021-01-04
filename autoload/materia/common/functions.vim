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

  " bind keys
  function! Mapping(modes, nore, key, command) abort
    for mode in a:modes
      execute mode . (a:nore ? 'nore' : '') .' <silent> ' . a:key .' '. a:command
    endfor
  endfunction

  " Get map keys
  let s:lkey = '<leader>'
  let s:akey = materia#conf('key.action')
  let s:lakey = materia#conf('key.localaction')
  let s:ekey = materia#conf('key.edge')
  let s:nkey = materia#conf('key.next')
  let s:pkey = materia#conf('key.prev')
  function! GetConfigMapPrefix(okey) abort
    return {
      \ 'view': s:lkey . a:okey,
      \ 'action': s:akey . a:okey,
      \ 'localaction': s:lakey,
      \ 'win': '<C-' . a:okey. '>',
      \ 'edge': s:ekey . a:okey,
      \ 'next': s:nkey . a:okey,
      \ 'prev': s:pkey . a:okey
    \ }
  endfunction
endfunction
