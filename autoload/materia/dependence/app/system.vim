"=============================================================================
" FILE: system.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

scriptencoding utf-8

let s:system = {}

let s:cache = {}

let s:system['is_windows'] = has('win16') || has('win32') || has('win64')

let s:system['is_linux'] = has('unix') && !has('macunix') && !has('win32unix')

let s:system['is_osx'] = has('macunix')

" windows, unix, cygwin, mac, linux
function! s:get_sysname() abort
  if s:system.is_linux
    return 'linux'
  elseif s:system.is_windows
    if has('win32unix')
      return 'cygwin'
    else
      return 'windows'
    endif
  else
    return 'mac'
  endif
endfunction

let s:system['name'] = s:get_sysname()

" get current user name
function! s:get_username()
  if exists('$USER')
    return $USER
  elseif exists('$USERNAME')
    return $USERNAME
  endif
  return ''
endfunction

let s:system['username'] = s:get_username()

" get gui mode
function! s:get_gui_mode()
  if (exists('+termguicolors') && &termguicolors) || has('gui_running')
    return 'gui'
  endif
  return 'cterm'
endfunction

let s:system['gui_mode'] = s:get_gui_mode()

" is gui
let s:system['is_gui'] = s:system['gui_mode'] ==# 'gui'

" system.has()
function! s:system.has(feature) abort
  if has_key(s:cache, a:feature)
    return s:cache[a:feature]
  endif

  if a:feature ==# 'python'
    try
      py import vim
      let s:cache['python'] = 1
      return 1
    catch
      let s:cache['python'] = 0
      return 0
    endtry
  elseif a:feature ==# 'python3'
    try
      py3 import vim
      let s:cache['python3'] = 1
      return 1
    catch
      let s:cache['python3'] = 0
      return 0
    endtry
  elseif a:feature ==# 'pythonx'
    try
      pyx import vim
      let s:cache['pythonx'] = 1
      return 1
    catch
      let s:cache['pythonx'] = 0
      return 0
    endtry
  else
    return has(a:feature)
  endif
endfunction

" system.version()
if has('nvim')
  function! s:system.version() abort
    let v = api_info().version
    return v.major . '.' . v.minor . '.' . v.patch
  endfunction
else
  function! s:system.version() abort
    redir => l:msg
    silent! execute ':version'
    redir END
    return s:parser(matchstr(l:msg,'\(Included\ patches:\ \)\@<=[^\n]*'))
  endfunction
  function! s:parser(version) abort
    let v_list = split(a:version, ',')
    if len(v_list) == 1
      let patch = split(v_list[0], '-')[1]
      let v = v:version[0:0] . '.' . v:version[2:2] . '.' . patch
    else
      let v = v:version[0:0] . '.' . v:version[2:2] . '(' . a:version . ')'
    endif
    return v
  endfunction
endif

if s:system.is_windows
  function! s:system.resolve(path) abort
    let cmd = 'dir /a ' . shellescape(a:path) . ' | findstr SYMLINK'
    silent let rst = system(cmd)
    if !v:shell_error
      let dir = split(rst)[-1][1:-2]
      return dir
    endif
    return a:path
  endfunction
else
  function! s:system.resolve(path) abort
    return resolve(a:path)
  endfunction
endif

function! materia#dependence#app#system#instance() abort
  return s:system
endfunction
