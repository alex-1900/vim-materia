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

  " enter the life cycle
  call materia#begin()
  call materia#loadplugs()
  call materia#end()
endfunction

function! materia#begin() abort
  " load configs
  call materia#config#load_environments()
  " load common
  call materia#common#options#get()
  call materia#common#functions#get()
  call materia#common#commands#get()
  call materia#common#maps#get()
  call materia#common#autocmds#get()
  " regist parts
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
  call materia#part#load_all_available()
  " Initialize plugin system
  call plug#end()
endfunction

function! materia#end() abort
endfunction

function! materia#homepath(...) abort
  return g:materia#path#home . get(a:, 1, '')
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" private
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
