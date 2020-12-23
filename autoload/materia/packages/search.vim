"=============================================================================
" FILE: search.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf_vim
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
" https://github.com/junegunn/fzf.vim
" https://github.com/junegunn/fzf
" https://github.com/ggreer/the_silver_searcher
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:fzf_vim = {}
function! s:fzf_vim.config()
  " Preview window on the right with 50% width
  let g:fzf_preview_window = ['right:50%', 'ctrl-/']
  " [Buffers] Jump to the existing window if possible
  let g:fzf_buffers_jump = 1
endfunction
function! s:fzf_vim.listener()
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
function! s:fzf_vim.install(install)
  call a:install('junegunn/fzf', { 'do': 'call fzf#install()' })
  call a:install('junegunn/fzf.vim')
endfunction
call materia#modules#add_package('fzf_vim', s:fzf_vim)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_interestingwords
" A vim plugin for highlighting and navigating through different words in a buffer.
" https://github.com/lfv89/vim-interestingwords
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_interestingwords = {}
function! s:vim_interestingwords.listener()
  " vim-interestingwords
  nnoremap <silent> <leader>k :call InterestingWords('n')<cr>
  vnoremap <silent> <leader>k :call InterestingWords('v')<cr>
  nnoremap <silent> <leader>K :call UncolorAllWords()<cr>
  nnoremap <silent> n :call WordNavigation(1)<cr>
  nnoremap <silent> N :call WordNavigation(0)<cr>
endfunction
function! s:vim_interestingwords.install(install)
  call a:install('lfv89/vim-interestingwords')
endfunction
call materia#modules#add_package('vim_interestingwords', s:vim_interestingwords)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_visualstar
" *visualstar* is a Vim plugin to provide a |star| feature for |Visual-mode|.
" In other words, you can search your selection text in |Visual-mode|.
" https://github.com/thinca/vim-visualstar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_visualstar = {}
function! s:vim_visualstar.install(install)
  call a:install('thinca/vim-visualstar')
endfunction
call materia#modules#add_package('vim_visualstar', s:vim_visualstar)
