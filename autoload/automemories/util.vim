"=============================================================================
" FILE: util.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

if exists('g:automemories_util_loaded')
  finish
endif
let g:automemories_util_loaded = 1

function! automemories#util#loaddir(dirpath)
  for path in split(glob(a:dirpath . '/*.vim'), '\n')
    execute 'source' path
  endfor
endfunction

const g:automemories#platform#win = 1
const g:automemories#platform#mac = 2
const g:automemories#platform#linux = 3

function! automemories#util#platform()
  if has('win32') || has('win64') || has('win95') || has('win16')
    return g:automemories#platform#win
  elseif has('mac') || has('macunix')
    return g:automemories#platform#mac
  else
    return g:automemories#platform#linux
  endif
endfunction

function! automemories#util#gui()
  return has('gui_running') || exists('g:GuiLoaded')
endfunction

function! automemories#util#nvim()
  return has('nvim')
endfunction

" get current user name
function! automemories#util#get_username()
  if exists('$USER')
    return $USER
  elseif exists('$USERNAME')
    return $USERNAME
  endif
  return 'my friend'
endfunction

const s:get_id_by_key_ids = {}

" get id by key
function! automemories#util#key_id(key)
  if !has_key(s:get_id_by_key_ids, a:key)
    let s:get_id_by_key_ids[a:key] = 0
  endif
  let s:get_id_by_key_ids[a:key] += 1
  return a:key . s:get_id_by_key_ids[a:key]
endfunction
