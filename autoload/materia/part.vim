"=============================================================================
" FILE: part.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

let s:parts = {}

let s:processed_depends = {}

augroup materia_parts_group
  autocmd!
  autocmd VimEnter * unlet s:processed_depends
augroup end

" add a part
function! materia#part#add(part) abort
  let s:parts[a:part.id] = a:part
  let parts_conf = materia#config#get('parts')
  if !materia#config#get('excludes.'. a:part.id)
    let s:processed_depends[a:part.id] = 1
  endif
endfunction

" get all part
function! materia#part#get_all() abort
  return s:parts
endfunction

" get part by id
function! materia#part#get(id) abort
  return s:parts[a:id]
endfunction

" has part
function! materia#part#has(id) abort
  return has_key(s:parts, a:id)
endfunction

" Load all available plugs
function! materia#part#load_all_available() abort
  let excludes = materia#config#get('excludes')
  for part_id in keys(s:parts)
    if !get(excludes, part_id, 0)
      call materia#part#load(part_id)
    endif
  endfor
endfunction

" get the plug installer.
function! s:get_materia_plug_install_func()
  let s:parts = {}
  function! s:materia_plug_install(repo, ...)
    if !has_key(s:parts, a:repo)
      call plug#(a:repo, get(a:, 1, {}))
      let s:parts[a:repo] = 1
    endif
  endfunction
  return function('s:materia_plug_install')
endfunction

let s:plug_installer = s:get_materia_plug_install_func()

" load a part by name
function! materia#part#load(id) abort
  if has_key(s:parts, a:id)
    let part = s:parts[a:id]

    " Depends process
    for part_id in get(part, 'includes', [])
      if !has_key(s:processed_depends, part_id)
        let s:processed_depends[part_id] = 1
        call materia#part#load(part_id)
      endif
    endfor

    " Tag process
    let tag = get(part, 'tag', 'normal')
    if exists('*materia#strategies#part_tag_'. tag)
      call materia#strategies#part_tag_{tag}(part, s:plug_installer)
    endif
  else
    let  l:app_message = materia#service#get('message')
    call l:app_message.warn('Custom part `'. a:id . '` not found.')
  endif
endfunction
