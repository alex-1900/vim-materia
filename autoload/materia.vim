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
  let g:materia#config = {}
  let s:json_parser = materia#dependence#get('coding#json')
  if filereadable(g:materia#path#home . '/config.json')
    let g:materia#config = s:json_parser.json_decode(join(readfile(g:materia#path#home . '/config.json'), "\n"))
  endif

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
  function! MateriaPlugInstall(repo, ...)
    if !has_key(s:packages, a:repo)
      let s:opt = get(a:, 1, {})
      call plug#(a:repo, s:opt)
      let s:packages[a:repo] = 1
    endif
  endfunction

  let s:modules = materia#modules#get_modules()
  " Specify a directory for plugins
  call plug#begin(g:materia#path#bundles)
  " load plug configures
  for s:name in get(g:materia#config, 'modules', [])
    if has_key(s:modules, s:name)
      let s:custom_packages = materia#modules#get_packages()
      for s:package_name in s:modules[s:name]
        if has_key(s:custom_packages, s:package_name)
          let s:package = s:custom_packages[s:package_name]
          if has_key(s:package, 'options')
            call s:package.options()
          endif
          if has_key(s:package, 'config')
            call s:package.config()
          endif
          if has_key(s:package, 'install')
            call s:package.install(function('MateriaPlugInstall'))
          endif
          if has_key(s:package, 'listener')
            execute 'autocmd User MateriaPlugLoaded nested call materia#modules#get_package("'. s:package_name .'").listener()'
          endif
        else
          let s:app_message = materia#dependence#get('app#message')
          call s:app_message.warn('Custom package `'. s:package_name . '` not found.')
        endif
      endfor
    endif
  endfor
  " Initialize plugin system
  call plug#end()
  " dispatch event for plugs loaded
  call materia#dispatch('MateriaPlugLoaded')
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

" dispatch user event
function! materia#dispatch(eventname)
  augroup am_mock
    execute 'autocmd User' a:eventname 'call s:emptyFunc()'
  augroup end
  execute 'doautocmd User' a:eventname
endfunction

function! s:emptyFunc()
endfunction

" process environments
function! s:process_environments()
  if exists('g:materia#config.environment') &&
    \ type(g:materia#config.environment) == type({})
    for s:env in keys(g:materia#config.environment)
      execute 'let $'. s:env . '=' . g:materia#config.environment[s:env]
    endfor
  endif
endfunction

" process packages
function! s:process_packages()
  for path in split(glob(a:dirpath . '/*'), '\n')

  endfor
endfunction
