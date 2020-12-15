"=============================================================================
" FILE: auto-pairs.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" Fugitive is the premier Vim plugin for Git. Or maybe it's the premier Git plugin for Vim?
" https://github.com/tpope/vim-fugitive
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function ListenerPlugLoadedFugitive()
  if HasPlug('vim-fugitive')
    nnoremap <leader>gg :Git --paginate<CR>
    nnoremap <leader>gd :Git diff<CR>
    nnoremap <leader>gl :Git log<CR>
    nnoremap <leader>grl :Git reflog<CR>
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => trigger
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PlugOptionDoFugitive(info = {})
  call ListenerPlugLoadedFugitive()
endfunction

Plug 'tpope/vim-fugitive', { 'do': function('PlugOptionDoFugitive') }
