"=============================================================================
" FILE: oceanic-next.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" Oceanic-Next.vim is a neovim theme inspired by Oceanic Next for Sublime.
" https://github.com/mhartington/oceanic-next
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function ListenerPlugLoadedOceanicNext()
  if HasPlug('oceanic-next')
    if (has("termguicolors"))
      set termguicolors
    endif
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    colorscheme OceanicNext
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => trigger
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PlugOptionDoOceanicNext(...)
  call ListenerPlugLoadedOceanicNext()
endfunction


Plug 'mhartington/oceanic-next', { 'do': function('PlugOptionDoOceanicNext') }

call AutocmdAmPlugLoaded('ListenerPlugLoadedOceanicNext')
