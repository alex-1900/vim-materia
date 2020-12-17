"=============================================================================
" FILE: fzf.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
" https://github.com/junegunn/fzf.vim
"
" https://github.com/junegunn/fzf
" https://github.com/ggreer/the_silver_searcher
"=============================================================================

" Preview window on the right with 50% width
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function ListenerPlugLoadedFzf()
  if HasPlug('fzf.vim') && HasPlug('fzf')
    nnoremap <leader>fm <plug>(fzf-maps-n)
    " Files (runs $FZF_DEFAULT_COMMAND if defined)
    nnoremap <leader>ff :Files<CR>
    " Git files (git status)
    nnoremap <leader>fg :GFiles?<CR>
    " Open buffers
    nnoremap <leader>fb :Buffers<CR>
    " ag search result (ALT-A to select all, ALT-D to deselect all)
    nnoremap <leader>fa :Ag<CR>
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => trigger
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PlugOptionDoFzf(info = {})
  call fzf#install()
  call ListenerPlugLoadedFzf()
endfunction

Plug 'junegunn/fzf', { 'do': function('PlugOptionDoFzf') }
Plug 'junegunn/fzf.vim'

call AutocmdAmPlugLoaded('ListenerPlugLoadedFzf')
