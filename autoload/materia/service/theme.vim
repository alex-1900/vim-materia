"=============================================================================
" FILE: theme.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

scriptencoding utf-8

let s:self = {}

let s:self.current_theme_id = 0

let s:theme_id_list = []

let s:app_message = materia#service#get('message')

function! s:self.add(id)
  call add(s:theme_id_list, a:id)
endfunction

function! s:self.get_all()
  return s:theme_id_list
endfunction

function! s:self.load(id)
  let part = materia#part#get(a:id)
  if has_key(part, 'preloader')   | call part.preloader() | endif
  if has_key(part, 'loader') | call part.loader() | endif
  let s:self.current_theme_id = a:id
  " print the user message
  let title = get(part, 'title', part.directory)
  call s:app_message.echomsg('Title', '{ UI: '. title . ', Key: '. part.id . ' }')
endfunction

function! s:self.load_offset(offset)
  if len(s:theme_id_list) > 0
    " get index of current theme
    " count from the beginning if current theme not in list
    let i = index(s:theme_id_list, s:self.current_theme_id) + a:offset
    " count from the beginning if count to the end
    if i == len(s:theme_id_list) | let i = 0 | endif
    let s:self.current_theme_id = s:theme_id_list[i]
    call s:self.load(s:self.current_theme_id)
  endif
endfunction

function! materia#service#theme#instance() abort
  return s:self
endfunction
