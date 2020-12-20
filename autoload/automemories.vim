"=============================================================================
" FILE: automemories.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================
scriptencoding utf-8

if exists('g:automemories_loaded')
  finish
endif
let g:automemories_loaded = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => public
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#init(homepath) abort
  " global variables
  let g:automemories#path#home = a:homepath
  let g:automemories#path#bundles = g:automemories#path#home . '/bundles'

  " load config from config json file
  let s:json_parser = automemories#dependence#get('coding#json')
  let g:automemories#config = s:json_parser.json_decode(join(readfile(g:automemories#path#home . '/config.json'), "\n"))

  " enter the life cycle
  call automemories#begin()
  call automemories#loadplugs()
  call automemories#end()
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Begin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#begin() abort
  " load configs
  call automemories#core#options#get()
  call automemories#core#commands#get()
  call automemories#core#maps#get()
  call automemories#core#functions#get()
  call automemories#core#autocmds#get()
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Load plugs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#loadplugs() abort
  call s:refresh_plugs()

  let s:packages = {}
  function! AutomemoriesPlugInstall(repo, ...)
    if !has_key(s:packages, a:repo)
      let s:opt = get(a:, 1, {})
      call plug#(a:repo, s:opt)
      let s:packages[a:repo] = 1
    endif
  endfunction

  let s:modules = automemories#modules#get()
  " Specify a directory for plugins
  call plug#begin(g:automemories#path#bundles)
  " load plug configures
  for s:name in g:automemories#config.modules
    if has_key(s:modules, s:name)
      for s:package in s:modules[s:name]
        execute 'call automemories#packages#'.s:package.'#options()'
        execute 'call automemories#packages#'.s:package.'#config()'
        execute 'call automemories#packages#'.s:package."#install(function('AutomemoriesPlugInstall'))"
        execute 'autocmd User AutomemoriesPlugLoaded nested call automemories#packages#'.s:package.'#listener()'
      endfor
    endif
  endfor
  " Initialize plugin system
  call plug#end()
  " dispatch event for plugs loaded
  call automemories#dispatch('AutomemoriesPlugLoaded')
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => End
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#end() abort
endfunction

function! automemories#homepath(...) abort
  return g:automemories#path#home . get(a:, 1, '')
endfunction

function! automemories#has_plug(name)
  if exists('g:loaded_plug')
    return isdirectory(g:automemories#path#bundles . '/' . a:name)
  endif
  return 0
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

function! s:refresh_plugs()
  " Run PlugInstall if there are missing plugins
  autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall
  \| endif
endfunction
