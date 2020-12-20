"=============================================================================
" FILE: util.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

if exists('g:automemories_util_loaded')
  finish
endif
let g:automemories_util_loaded = 1

" get current user name
function! automemories#util#get_username(...)
  if exists('$USER')
    return $USER
  elseif exists('$USERNAME')
    return $USERNAME
  endif
  return get(a:, 0, '')
endfunction

function! automemories#util#is_windows()
  return has('win32') || has('win64') || has('win95') || has('win16')
endfunction

function! automemories#util#is_macos()
  return has('mac') || has('macunix') || has('gui_macvim')
endfunction

function! automemories#util#message_error(msg) abort
  echohl WarningMsg | echomsg '[automemories] ' . mes | echohl None
endfunction

function! automemories#util#message_mode(msg) abort
  echohl ModeMsg | echomsg '[automemories] ' . mes | echohl None
endfunction

function! automemories#util#gui_mode()
  if (exists('+termguicolors') && &termguicolors) || has('gui_running')
    return 'gui'
  endif
  return 'cterm'
endfunction

function! automemories#util#is_gui()
  return automemories#util#gui_mode() == 'gui'
endfunction

" load an dotenv file
function! automemories#util#loadenv(file, ...) abort
  let file = a:file
  let lines = []
  for line in readfile(file)
    let matches = matchlist(line, '\v\C^%(export\s+)=([[:alnum:]_.]+)%(\s*\=\s*|:\s{-})(''%(\\''|[^''])*''|"%(\\"|[^"])*"|[^#]+)=%( *#.*)?$')
    if !empty(matches)
      call add(lines, matches[1:2])
    endif
  endfor
  let env = a:0 ? a:1 : {}
  for [key, value] in lines
    if !has_key(env, key)
      if value =~# '^\s*".*"\s*$'
        let value = substitute(value, '\n', "\n", 'g')
        let value = substitute(value, '\\\ze[^$]', '', 'g')
      endif
      let value = substitute(value, '^\s*\([''"]\)\=\(.\{-\}\)\1\s*$', '\2', '')
      let value = substitute(value, '\\\=\${.\{-\}}\|\\\=\$\w\+', '\=s:lookup(submatch(0), env)', 'g')
      let env[key] = value
    endif
  endfor
  return env
endfunction
