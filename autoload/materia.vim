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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Begin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Load plugs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! materia#loadplugs() abort
  " Run PlugInstall if there are missing plugins
  autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall
  \| endif

  let s:packages = {}
  function! s:materia_plug_install(repo, ...)
    if !has_key(s:packages, a:repo)
      let l:opt = get(a:, 1, {})
      call plug#(a:repo, l:opt)
      let s:packages[a:repo] = 1
    endif
  endfunction

  let l:modules = materia#modules#get_modules()
  " Specify a directory for plugins
  call plug#begin(g:materia#path#bundles)
  " load plug configures
  for l:name in materia#conf('modules')
    if has_key(l:modules, l:name)
      let l:custom_packages = materia#modules#get_packages()
      for l:package_name in l:modules[l:name]
        if has_key(l:custom_packages, l:package_name)
          let l:package      =  l:custom_packages[l:package_name]
          let l:execute_code =  'autocmd VimEnter * nested call materia#modules#get_package("'. l:package_name .'").listener()'
          if has_key(l:package, 'options')  | call l:package.options() | endif
          if has_key(l:package, 'config')   | call l:package.config() | endif
          if has_key(l:package, 'install')  | call l:package.install(function('s:materia_plug_install')) | endif
          if has_key(l:package, 'listener') | execute l:execute_code | endif
        else
          let  l:app_message = materia#dependence#get('app#message')
          call l:app_message.warn('Custom package `'. l:package_name . '` not found.')
        endif
      endfor
    endif
  endfor
  " Initialize plugin system
  call plug#end()
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => End
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
function! materia#conf(name)
  if exists('g:materia#config.' . a:name)
    execute 'let result = g:materia#config.' . a:name
    return result
  endif
  if exists('g:materia#default_config.' . a:name)
    execute 'let result = g:materia#default_config.' . a:name
    return result
  endif
  return 0
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => private
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" process environments
function! s:process_environments()
  if exists('g:materia#config.environment') &&
    \ type(g:materia#config.environment) == type({})
    for l:env in keys(g:materia#config.environment)
      execute 'let $'. l:env . '=' . g:materia#config.environment[s:env]
    endfor
  endif
endfunction

" load config from json file
function! s:process_json_configure()
  let l:json_parser = materia#dependence#get('coding#json')
  let g:materia#config = {}
  let g:materia#default_config = l:json_parser.json_decode(join(readfile(g:materia#path#home . '/config.default.json'), "\n"))
  if filereadable(g:materia#path#home . '/config.json')
    let g:materia#config = l:json_parser.json_decode(join(readfile(g:materia#path#home . '/config.json'), "\n"))
  endif
endfunction
