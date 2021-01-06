"=============================================================================
" FILE: functions.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

function! materia#common#functions#get() abort
  let s:app_message = materia#service#get('message')

  " return 1 if plug exist
  function! HasPlug(name)
    return isdirectory(g:materia#path#bundles . '/' . a:name)
  endfunction

  " bind keys
  function! Mapping(modes, nore, key, command) abort
    for mode in a:modes
      execute mode . (a:nore ? 'nore' : '') .' <silent> ' . a:key .' '. a:command
    endfor
  endfunction

  " Load a theme by part name
  function! LoadUiTheme(part_name)
    let themes = materia#part#get_themes()
    let part = materia#part#get(themes[a:part_name])
    if has_key(part, 'preloader')   | call part.preloader() | endif
    if has_key(part, 'loader') | call part.loader() | endif
    let title = get(part, 'title', part.directory)
    call s:app_message.echomsg('Title', '{ UI: '. title . ', Key: '. part.key . ' }')
  endfunction

  " Create the `AroundTheme` function
  function! s:create_around_theme_function()
    let s:theme_names = 0
    let s:current_theme_name = 0
    function! AroundUiTheme(...)
      if type(s:theme_names) != type([])
        let s:theme_names = keys(materia#part#get_themes())
      endif
      if len(s:theme_names) > 0
        let i = index(s:theme_names, s:current_theme_name)
        if i < 0 | let i = 0 | endif
        let i = i + get(a:, 1, 1)
        if i == len(s:theme_names) | let i = 0 | endif
        if i < 0 | let i = len(s:theme_names) - 1 | endif
        let s:current_theme_name = s:theme_names[i]
        call LoadUiTheme(s:current_theme_name)
      endif
    endfunction
  endfunction
  call s:create_around_theme_function()

  " Get map keys
  let s:rkey = '<leader>'
  let s:wkey = materia#conf('key.writer')
  let s:skey = materia#conf('key.state')
  let s:nkey = materia#conf('key.next')
  let s:pkey = materia#conf('key.prev')
  function! GetConfigMapPrefix(okey) abort
    return {
      \ 'reader': s:rkey . a:okey,
      \ 'writer': s:wkey . a:okey,
      \ 'win': '<C-' . a:okey. '>',
      \ 'state': s:skey . a:okey,
      \ 'next': s:nkey . a:okey,
      \ 'prev': s:pkey . a:okey
    \ }
  endfunction
endfunction
