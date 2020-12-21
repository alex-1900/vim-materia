"=============================================================================
" FILE: functions.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

function! automemories#core#functions#get()
  " return 1 if plug exist
  function! HasPlug(name)
    if exists('g:loaded_plug')
      return isdirectory(g:automemories#path#bundles . '/' . a:name)
    endif
    return 0
  endfunction

  " AutomemoriesPlugLoaded handler
  function! AutocmdAmPlugLoaded(func)
    autocmd User AutomemoriesPlugLoaded nested call a:fun
  endfunction
endfunction
