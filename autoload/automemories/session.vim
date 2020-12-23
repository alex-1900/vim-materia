"=============================================================================
" FILE: session.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
" https://github.com/xolox/vim-session
" https://github.com/tpope/vim-obsession/blob/master/plugin/obsession.vim
"=============================================================================

if exists("g:automemories_session_loaded")
  finish
endif
let g:automemories_session_loaded = 1

if !exists("g:automemories_session_directory")
  let g:automemories_session_directory = automemories#homepath('/sessions')
endif

if !exists("g:automemories_session_extension")
  let g:automemories_session_extension = '.vim'
endif

let s:session_hash_directory = g:automemories_session_directory . '/hash'
let s:session_custom_directory = g:automemories_session_directory . '/custom'

function! automemories#session#save_hash(name)
  if !isdirectory(s:session_hash_directory)
    call mkdir(s:session_hash_directory, 'p')
  endif
  execute 'mksession!' s:session_hash(a:name)
endfunction

function! automemories#session#save_custom(name)
  if !isdirectory(s:session_custom_directory)
    call mkdir(s:session_custom_directory, 'p')
  endif
  execute 'mksession!' s:session_custom(a:name)
  call automemories#dispatch('AutomemoriesSessionChangeed')
endfunction

function! automemories#session#load_hash(name)
  call automemories#session#load(s:session_hash(a:name))
endfunction

function! automemories#session#load_custom(name)
  call automemories#session#load(s:session_custom(a:name))
endfunction

function! automemories#session#delete_custom(name)
  let s:filename = s:session_custom(a:name)
  if filereadable(s:filename)
    setlocal modifiable
    call delete(s:filename)
    call automemories#dispatch('AutomemoriesSessionChangeed')
    call automemories#dispatch('AutomemoriesSessionDeleted')
  endif
endfunction

function s:session_hash(name)
  let s:filename = substitute(a:name, '[.:/\\#$-]', '_', 'g')[0:200]
  return s:session_hash_directory . '/' . s:filename . g:automemories_session_extension
endfunction

function s:session_custom(name)
  return s:session_custom_directory . '/' . a:name . g:automemories_session_extension
endfunction

function! automemories#session#get_hash_filepath(name)
  let s:filename = s:session_hash(a:name)
  if filereadable(s:filename)
    return s:filename
  endif
  return 0
endfunction

function! automemories#session#get_custom_filepath(name)
  let s:filename = s:session_custom(a:name)
  if filereadable(s:filename)
    return s:filename
  endif
  return 0
endfunction

function! automemories#session#load(name)
  if filereadable(a:name)
    execute 'source' a:name
    if bufexists(1)
      for l in range(1, bufnr('$'))
          if bufwinnr(l) == -1
              exec 'sbuffer ' . l
          endif
      endfor
    endif
  endif
endfunction
