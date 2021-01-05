"=============================================================================
" FILE: packages.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

let s:packages = {}

let s:themes = {}

" add a package
function! materia#packages#add(name, package) abort
  let s:packages[a:name] = a:package
endfunction

" get all packages
function! materia#packages#get_all() abort
  return s:packages
endfunction

" get package by name
function! materia#packages#get(name) abort
  return s:packages[a:name]
endfunction

" get the plug installer.
function! s:get_materia_plug_install_func()
  let s:packages = {}
  function! s:materia_plug_install(repo, ...)
    if !has_key(s:packages, a:repo)
      call plug#(a:repo, get(a:, 1, {}))
      let s:packages[a:repo] = 1
    endif
  endfunction
  return function('s:materia_plug_install')
endfunction

let s:plug_installer = s:get_materia_plug_install_func()

" load a package by name
function! materia#packages#load(name, ...) abort
  if has_key(s:packages, a:name)
    let package = s:packages[a:name]
    let tag = get(package, 'tag', 'normal')
    if exists('*materia#strategies#package_tag_'. tag)
      let without_condition = get(a:, 1, 0)
      call materia#strategies#package_tag_{tag}(a:name, package, s:plug_installer, without_condition)
    endif
  else
    let  l:app_message = materia#service#get('message')
    call l:app_message.warn('Custom package `'. a:name . '` not found.')
  endif
endfunction

function! materia#packages#bind_theme(name, package_name)
  let s:themes[a:name] = a:package_name
endfunction

function! materia#packages#get_themes()
  return s:themes
endfunction
