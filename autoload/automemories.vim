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
  const g:automemories#path#home = a:homepath

  const g:automemories#path#bundles = g:automemories#path#home . '/bundles'

  " load system env
  const s:env_file = g:automemories#path#home . '/.env'
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
  call automemories#util#loaddir(g:automemories#path#home . '/default/config/setting')
  call automemories#util#loaddir(g:automemories#path#home . '/default/config/function')
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
  call automemories#util#loaddir(g:automemories#path#home . '/default/plugin')
  " Initialize plugin system
  call plug#end()
endfunction

" end of loading
function! automemories#end() abort
  " tragger event listeners
  call automemories#util#loaddir(g:automemories#path#home . '/default/config/event')
  " disptach events
  doautocmd User AutomemoriesPlugLoaded
endfunction

" get system env from .env file
function! automemories#getenv(key) abort
  if has_key(s:envs, a:key)
    return s:envs[a:key]
  endif
  return 0
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => private
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
