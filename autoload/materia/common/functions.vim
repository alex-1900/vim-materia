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

  " Load a theme by package name
  function! LoadUiTheme(package_name)
    let themes = materia#packages#get_themes()
    let package = materia#packages#get(themes[a:package_name])
    if has_key(package, 'preloader')   | call package.preloader() | endif
    if has_key(package, 'loader') | call package.loader() | endif
    let title = get(package, 'title', package.name)
    call s:app_message.echomsg('Title', 'Theme: '. title)
  endfunction

  " Create the `AroundTheme` function
  function! s:create_around_theme_function()
    let s:theme_names = 0
    let s:current_theme_name = 0
    function! AroundUiTheme(...)
      if type(s:theme_names) != type([])
        let s:theme_names = keys(materia#packages#get_themes())
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
