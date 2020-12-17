"=============================================================================
" FILE: automemories.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

if exists('g:automemories_loaded')
  finish
endif
let g:automemories_loaded = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => public
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let s:envs = {}

function! automemories#init(homepath) abort
  " global variables
  let g:automemories#path#home = a:homepath
  let g:automemories#path#default = g:automemories#path#home . '/default'
  let g:automemories#path#bundles = g:automemories#path#home . '/bundles'

  " load system env
  let s:env_file = g:automemories#path#home . '/.env'
  if filereadable(s:env_file)
    let s:envs = automemories#util#dotenv#load(s:env_file)
  endif

  " enter the life cycle
  call automemories#begin()
  call automemories#loadplugs()
  call automemories#end()
endfunction

function! automemories#begin() abort
  " load configs
  call s:loaddir(g:automemories#path#default . '/setting')
  call s:loaddir(g:automemories#path#default . '/function')
  " dispatch event for automemories starting
  call automemories#dispatch('AutomemoriesStarting')
endfunction

" load plugs
function! automemories#loadplugs() abort
  " Run PlugInstall if there are missing plugins
  autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall
  \| endif

  " Specify a directory for plugins
  call plug#begin(g:automemories#path#bundles)
  " load plug configures
  call s:loaddir(g:automemories#path#default . '/plugin')
  " Initialize plugin system
  call plug#end()
  " dispatch event for plugs loaded
  call automemories#dispatch('AutomemoriesPlugLoaded')
endfunction

" end of loading
function! automemories#end() abort
endfunction

" get system env from .env file
function! automemories#getenv(key) abort
  if has_key(s:envs, a:key)
    return s:envs[a:key]
  endif
  return 0
endfunction

function! automemories#homepath(path = '') abort
  return g:automemories#path#home . a:path
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => private
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" load all vim files from dir
function! s:loaddir(dirpath)
  for path in split(glob(a:dirpath . '/*.vim'), '\n')
    execute 'source' path
  endfor
endfunction

" dispatch user event
function! automemories#dispatch(eventname)
  augroup am_mock
    execute 'autocmd User' a:eventname 'call s:emptyFunc()'
  augroup end
  execute 'doautocmd User' a:eventname
endfunction

function s:emptyFunc()
endfunction
