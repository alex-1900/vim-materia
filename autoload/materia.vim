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
" public
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! materia#init(homepath) abort
  " global variables
  let g:materia#path#home = a:homepath
  let g:materia#path#bundles = g:materia#path#home . '/bundles'

  " create the temp dir
  let temp_dir = materia#homepath('/temp')
  if !isdirectory(temp_dir)
    call mkdir(temp_dir, 'p')
  endif

  " load config from config json file
  call s:process_json_configure()
  " enter the life cycle
  call materia#begin()
  call materia#loadplugs()
  call materia#end()
endfunction

function! materia#begin() abort
  " load configs
  call materia#common#options#get()
  call materia#common#functions#get()
  call materia#common#commands#get()
  call materia#common#maps#get()
  call materia#common#autocmds#get()

  call s:process_environments()
  call s:loaddir(g:materia#path#home . '/parts')
  " load custom settings
  let custom_entry_file = materia#homepath('/custom/main.vim')
  if filereadable(custom_entry_file)
    execute 'source ' . custom_entry_file
  endif
endfunction

function! materia#loadplugs() abort
  " Specify a directory for plugins
  call plug#begin(g:materia#path#bundles)
  " load plugs
  for part_id in keys(materia#conf('parts'))
    " Load enable parts
    if materia#conf('parts.'. part_id . '.disable') == 0
      call materia#part#load(part_id)
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
" private
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
  let g:materia#config = {}
  let g:materia#default_config = json_decode(join(readfile(g:materia#path#home . '/config.default.json'), "\n"))
  if filereadable(g:materia#path#home . '/config.json')
    let g:materia#config = json_decode(join(readfile(g:materia#path#home . '/config.json'), "\n"))
  endif
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
