"=============================================================================
" FILE: commands.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

function! materia#core#commands#get()
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => session
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  if exists('g:materia#config.options.session.enable') &&
    \ g:materia#config.options.session.enable
    " create a custom session
    command! -nargs=1 AmSessionCreate call materia#session#save_custom(<f-args>)

    " load a custom session
    command! -nargs=1 AmSessionLoad call materia#session#load_custom(<f-args>)

    " Delete a custom session
    command! -nargs=1 AmSessionDelete call materia#session#delete_custom(<f-args>)
  endif
endfunction
