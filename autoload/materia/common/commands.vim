"=============================================================================
" FILE: commands.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

function! materia#common#commands#get()
  " Select next UI theme
  command! -nargs=0 NextTheme call AroundUiTheme(1)
  " Select prev UI theme
  command! -nargs=0 PrevTheme call AroundUiTheme(-1)
endfunction
