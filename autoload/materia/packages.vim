"=============================================================================
" FILE: packages.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

let s:packages = {}

function! materia#packages#add_package(name, package) abort
  let s:packages[a:name] = a:package
endfunction

function! materia#packages#get_packages() abort
  return s:packages
endfunction

function! materia#packages#get_package(name) abort
  return s:packages[a:name]
endfunction
