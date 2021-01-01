"=============================================================================
" FILE: materia.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================
scriptencoding utf-8

if exists('g:materia_loaded')
  finish
endif
let g:materia_loaded = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => public
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! materia#init(homepath) abort
  " global variables
  let g:materia#path#home = a:homepath
  let g:materia#path#bundles = g:materia#path#home . '/bundles'

  " load config from config json file
  call s:process_json_configure()
  " enter the life cycle
  call materia#begin()
  call materia#loadplugs()
  call materia#end()
endfunction

function! materia#begin() abort
  " load configs
  call materia#core#options#get()
  call materia#core#commands#get()
  call materia#core#maps#get()
  call materia#core#functions#get()
  call materia#core#autocmds#get()

  call s:process_environments()
  call s:loaddir(g:materia#path#home . '/autoload/materia/packages')
  " load custom settings
  if isdirectory(g:materia#path#home . '/custom')
    call s:loaddir(g:materia#path#home . '/custom')
  endif
endfunction

function! materia#loadplugs() abort
  " let s:plug_installer = s:get_materia_plug_install_func()
  " Specify a directory for plugins
  call plug#begin(g:materia#path#bundles)
  " load plugs
  for package_name in keys(materia#conf('packages'))
    " Load enable packages
    if materia#conf('packages.'. package_name . '.disable') == 0
      call materia#packages#load_package(package_name)
    endif
  endfor
  " Initialize plugin system
  call plug#end()
endfunction

function! materia#end() abort
endfunction

function! materia#homepath(...) abort
  return g:materia#path#home . get(a:, 1, '')
endfunction

function! materia#has_plug(name)
  if exists('g:loaded_plug')
    return isdirectory(g:materia#path#bundles . '/' . a:name)
  endif
  return 0
endfunction

" Get configure
" Priority return custom option and `dict` type options will be merged
function! materia#conf(name)
  if exists('g:materia#default_config.' . a:name)
    execute 'let result_default = g:materia#default_config.' . a:name
    if exists('g:materia#config.' . a:name)
      execute 'let result_custom = g:materia#config.' . a:name
      if type(result_default) == type({})
        return extend(result_default, result_custom)
      endif
      return result_custom
    endif
    return result_default
  endif
  return 0
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => private
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" process environments
function! s:process_environments()
  if exists('g:materia#config.environment') &&
    \ type(g:materia#config.environment) == type({})
    for env in keys(g:materia#config.environment)
      execute 'let $'. env . '=' . g:materia#config.environment[env]
    endfor
  endif
endfunction

" load config from json file
function! s:process_json_configure()
  let l:json_parser = materia#dependence#get('data#json')
  let g:materia#config = {}
  let g:materia#default_config = l:json_parser.json_decode(join(readfile(g:materia#path#home . '/config.default.json'), "\n"))
  if filereadable(g:materia#path#home . '/config.json')
    let g:materia#config = l:json_parser.json_decode(join(readfile(g:materia#path#home . '/config.json'), "\n"))
  endif
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

" load all vim files from dir
function! s:loaddir(dirpath)
  for path in split(glob(a:dirpath . '/*'), '\n')
    if path =~ '.vim$'
      execute 'source' path
    elseif isdirectory(path)
      call s:loaddir(path)
    endif
  endfor
endfunction
