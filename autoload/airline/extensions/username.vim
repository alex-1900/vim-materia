" vim: et ts=2 sts=2 sw=2

scriptencoding utf-8

" First we define an init function that will be invoked from extensions.vim
function! airline#extensions#username#init(ext)
  if materia#conf('packages.vim_airline.with_username')
    call a:ext.add_statusline_func('airline#extensions#username#apply')
    call a:ext.add_inactive_statusline_func('airline#extensions#username#apply')
  endif
endfunction

" This function will be invoked just prior to the statusline getting modified.
function! airline#extensions#username#apply(...)
  let builder = a:1
  let system_serv = materia#dependence#get('app#system')
  highlight userStatusLine guifg=#EEEEEE ctermfg=7 guibg=#4169E1 ctermbg=24 gui=NONE cterm=NONE
  let username = airline#section#create([system_serv.username])
  call builder.add_section_spaced('UserStatusLine', username)
  return 0
endfunction
