"=============================================================================
" FILE: system.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

scriptencoding utf-8

function! s:self.is_number(var) abort
  return type(a:var) ==# 0
endfunction

function! s:self.is_string(var) abort
  return type(a:var) ==# 1
endfunction

function! s:self.is_func(var) abort
  return type(a:var) ==# 2
endfunction

function! s:self.is_list(var) abort
  return type(a:var) ==# 3
endfunction

function! s:self.is_dict(var) abort
  return type(a:var) ==# 4
endfunction

function! s:self.is_float(var) abort
  return type(a:var) ==# 5
endfunction

function! s:self.is_bool(var) abort
  return type(a:var) ==# 6
endfunction

function! s:self.is_none(var) abort
  return type(a:var) ==# 7
endfunction

function! s:self.is_job(var) abort
  return type(a:var) ==# 8
endfunction

function! s:self.is_channel(var) abort
  return type(a:var) ==# 9
endfunction

function! s:self.is_blob(var) abort
  return type(a:var) ==# 10
endfunction

function! SpaceVim#api#vim#get() abort
  return s:self
endfunction

function! automemories#dependence#app#viml#instance() abort
  return s:self
endfunction
