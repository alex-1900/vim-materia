"=============================================================================
" FILE: am_vim_leave.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

augroup am_vim_leave
  autocmd VimLeave *
    \  call ListenerVimLeaveVimSession()
augroup end
