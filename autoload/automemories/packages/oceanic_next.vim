"=============================================================================
" FILE: oceanic_next.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" Oceanic-Next.vim is a neovim theme inspired by Oceanic Next for Sublime.
" https://github.com/mhartington/oceanic-next
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#oceanic_next#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#oceanic_next#config()
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#oceanic_next#listener()
  if (has("termguicolors"))
    set termguicolors
  endif
  colorscheme OceanicNext
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#oceanic_next#install(install)
  call a:install('mhartington/oceanic-next')
endfunction
