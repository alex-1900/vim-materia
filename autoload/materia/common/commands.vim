"=============================================================================
" FILE: commands.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

function! materia#common#commands#get()
  let s:service_theme = materia#service#get('theme')

  " Select UI theme by key
  command! -nargs=1 LoadUI call s:service_theme.load(<f-args>)
  " Select next UI theme
  command! -nargs=0 NextUI call s:service_theme.load_offset(1)
  " Select prev UI theme
  command! -nargs=0 PrevUI call s:service_theme.load_offset(-1)
endfunction
