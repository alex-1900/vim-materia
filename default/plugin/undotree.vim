"=============================================================================
" FILE: undotree.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" The plug-in visualizes undo history and makes it easier to browse and switch between different undo branches
" https://github.com/mbbill/undotree
"=============================================================================

if has("persistent_undo")
  set undodir=$HOME."/.undodir"
  set undofile
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function ListenerPlugLoadedUndotree()
  if HasPlug('undotree')
    nnoremap <leader>u :UndotreeToggle<CR>
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => trigger
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PlugOptionDoUndotree(...)
  call ListenerPlugLoadedUndotree()
endfunction

Plug 'mbbill/undotree', { 'do': function('PlugOptionDoUndotree') }

call AutocmdAmPlugLoaded('ListenerPlugLoadedUndotree')
