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
    nnoremap <leader><tab> <plug>(fzf-maps-n)
    " Files (runs $FZF_DEFAULT_COMMAND if defined)
    nnoremap <leader>sf :Files<CR>
    " Git files (git status)
    nnoremap <leader>sg :GFiles?<CR>
    " Open buffers
    nnoremap <leader>sb :Buffers<CR>
    " ag search result (ALT-A to select all, ALT-D to deselect all)
    nnoremap <leader>sa :Ag<CR>
    " Git commits (requires fugitive.vim)
    nnoremap <leader>sc :Commits<CR>
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => trigger
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PlugOptionDoFzf(info = {})
  fzf#install()
  call ListenerPlugLoadedFzf()
endfunction

Plug 'junegunn/fzf', { 'do': function('PlugOptionDoFzf') }
Plug 'junegunn/fzf.vim'
