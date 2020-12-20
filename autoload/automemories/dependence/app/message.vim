"=============================================================================
" FILE: system.vim
" Author: Wang Shidong < wsdjeg at 163.com >
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================

scriptencoding utf-8

let s:self = {}

function! s:self.echo(hl, msg) abort
  execute 'echohl' a:hl
  try
    echo a:msg
  finally
    echohl None
  endtry
endfunction

function! s:self.echon(hl, msg) abort
  execute 'echohl' a:hl
  try
    echon a:msg
  finally
    echohl None
  endtry
endfunction

function! s:self.echomsg(hl, msg) abort
  execute 'echohl' a:hl
  try
    for m in split(a:msg, "\n")
      echomsg m
    endfor
  finally
    echohl None
  endtry
endfunction

function! s:self.error(msg) abort
  call self.echomsg('ErrorMsg', a:msg)
endfunction

function! s:self.warn(msg) abort
  call self.echomsg('WarningMsg', a:msg)
endfunction

function! s:self.confirm(msg) abort
  echohl WarningMsg
  echon a:msg . '? (y or n) '
  echohl NONE
  let rst = nr2char(getchar())
  " clear the cmdline
  redraw!
  if rst =~? 'y' || rst == nr2char(13)
    return 1
  else
    return 0
  endif
endfunction

function! automemories#dependence#app#message#instance() abort
  return s:self
endfunction
