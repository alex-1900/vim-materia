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
  let s:rkey = '<leader>'
  let s:wkey = materia#conf('key.writer')
  let s:skey = materia#conf('key.state')
  let s:nkey = materia#conf('key.next')
  let s:pkey = materia#conf('key.prev')
  function! GetConfigMapPrefix(okey) abort
    return {
      \ 'reader': s:rkey . a:okey,
      \ 'writer': s:wkey . a:okey,
      \ 'win': '<C-' . a:okey. '>',
      \ 'state': s:skey . a:okey,
      \ 'next': s:nkey . a:okey,
      \ 'prev': s:pkey . a:okey
    \ }
  endfunction
endfunction
