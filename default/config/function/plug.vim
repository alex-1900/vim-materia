"=============================================================================
" FILE: plug.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

function HasPlug(name)
  if exists('g:loaded_plug')
    return isdirectory(g:automemories#path#bundles . '/' . a:name)
  endif
  return 0
endfunction
