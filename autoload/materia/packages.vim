"=============================================================================
" FILE: packages.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

let s:packages = {}

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

function! materia#packages#load(name) abort
  if has_key(s:packages, a:name)
    let package = s:packages[a:name]
    if HasPlug(package.name)
      let execute_vim_enter =  'autocmd VimEnter * nested call materia#packages#get("'. a:name .'").listener()'
      if has_key(package, 'options')  | call package.options() | endif
      if has_key(package, 'config')   | call package.config() | endif
      if has_key(package, 'listener') | execute execute_vim_enter | endif
    endif
    if has_key(package, 'install')  | call package.install(s:plug_installer) | endif
  else
    let  l:app_message = materia#service#get('message')
    call l:app_message.warn('Custom package `'. a:name . '` not found.')
  endif
endfunction
