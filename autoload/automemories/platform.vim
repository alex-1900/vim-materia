
"=============================================================================
" FILE: platform.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

let s:win = 1
let s:mac = 2
let s:linux = 3

function! s:get_platform()
  if has('win32') || has('win64') || has('win95') || has('win16')
    return s:win
  elseif has('mac') || has('macunix')
    return s:mac
  else
    return s:linux
  endif
endfunction

function! automemories#platform#is_windows()
  return s:get_platform() == s:win
endfunction

function! automemories#platform#is_macos()
  return s:get_platform() == s:mac
endfunction

function! automemories#platform#is_linux()
  return s:get_platform() == s:linux
endfunction

function! automemories#platform#gui()
  return has('gui_running') || exists('g:GuiLoaded')
endfunction

function! automemories#platform#nvim()
  return has('nvim')
endfunction
