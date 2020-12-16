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
function! automemories#util#get_username()
  if exists('$USER')
    return $USER
  elseif exists('$USERNAME')
    return $USERNAME
  endif
  return 'my friend'
endfunction
