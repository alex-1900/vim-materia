"=============================================================================
" FILE: part.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

let s:parts = {}

let s:themes = {}

" add a part
function! materia#part#add(name, part) abort
  let s:parts[a:name] = a:part
endfunction

" get all part
function! materia#part#get_all() abort
  return s:parts
endfunction

" get part by name
function! materia#part#get(name) abort
  return s:parts[a:name]
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
function! materia#part#load(name) abort
  if has_key(s:parts, a:name)
    let part = s:parts[a:name]
    let tag = get(part, 'tag', 'normal')
    if exists('*materia#strategies#part_tag_'. tag)
      call materia#strategies#part_tag_{tag}(a:name, part, s:plug_installer)
    endif
  else
    let  l:app_message = materia#service#get('message')
    call l:app_message.warn('Custom part `'. a:name . '` not found.')
  endif
endfunction

function! materia#part#bind_theme(name, part_name)
  let s:themes[a:name] = a:part_name
endfunction

function! materia#part#get_themes()
  return s:themes
endfunction
