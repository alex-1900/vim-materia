"=============================================================================
" FILE: search.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
" https://github.com/junegunn/fzf.vim
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#fzf_vim#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#fzf_vim#config()
  " Preview window on the right with 50% width
  let g:fzf_preview_window = ['right:50%', 'ctrl-/']
  " [Buffers] Jump to the existing window if possible
  let g:fzf_buffers_jump = 1
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#fzf_vim#listener()
  nnoremap <leader>fm <plug>(fzf-maps-n)
  " Files (runs $FZF_DEFAULT_COMMAND if defined)
  nnoremap <leader>ff :Files<CR>
  " Git files (git status)
  nnoremap <leader>fg :GFiles?<CR>
  " Open buffers
  nnoremap <leader>fb :Buffers<CR>
  " ag search result (ALT-A to select all, ALT-D to deselect all)
  nnoremap <leader>fa :Ag<CR>
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#fzf_vim#install(install)
  call a:install('junegunn/fzf.vim')
endfunction
