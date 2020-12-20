"=============================================================================
" FILE: vim_peekaboo.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" Peekaboo will show you the contents of the registers on the sidebar when you hit " or @ in normal mode or <CTRL-R> in insert mode.
" The sidebar is automatically closed on subsequent key strokes.
" You can toggle fullscreen mode by pressing spacebar.
" https://github.com/junegunn/vim-peekaboo
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_peekaboo#options()
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_peekaboo#config()
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_peekaboo#listener()
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_peekaboo#install(install)
  call a:install('junegunn/vim-peekaboo')
endfunction
