"=============================================================================
" FILE: service.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================
scriptencoding utf-8

let s:dependencies = {}

" Get service by name
function! materia#service#get(name) abort
  if !has_key(s:dependencies, a:name)
    try
      let entity = deepcopy(materia#service#{a:name}#instance())
      call materia#service#add(a:name, entity)
    catch
      return 0
    endtry
  endif
  return s:dependencies[a:name]
endfunction

" Add the service with name
function! materia#service#add(name, entity) abort
  let s:dependencies[a:name] = a:entity
endfunction
