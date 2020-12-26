"=============================================================================
" FILE: search.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf_vim
" Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
" Dependencies: https://github.com/junegunn/fzf.vim#dependencies
"
" https://github.com/junegunn/fzf.vim
" https://github.com/junegunn/fzf
" https://github.com/ggreer/the_silver_searcher
" https://github.com/BurntSushi/ripgrep
" https://github.com/sharkdp/bat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:fzf_vim = {}
function! s:fzf_vim.config()
  " give the same prefix to the commands
  let g:fzf_command_prefix = materia#conf('packages.fzf_vim.command_prefix')
  " Preview window on the right with 50% width
  let g:fzf_preview_window = materia#conf('packages.fzf_vim.preview_window')
  " [Buffers] Jump to the existing window if possible
  let g:fzf_buffers_jump = 1
  " [[B]Commits] Customize the options used by 'git log':
  let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
  " Enable per-command history
  let g:fzf_history_dir = materia#homepath('/temp/fzf_history')
endfunction

function! s:fzf_vim.listener()
  let key_prefix = GetConfigMapPrefix(materia#conf('packages.fzf_vim.basekey'))
  let command_prefix = materia#conf('packages.fzf_vim.command_prefix')
  " Mapping selecting mappings
  execute 'nmap <silent> '. key_prefix.view . 'n <plug>(fzf-maps-n)'
  execute 'xmap <silent> '. key_prefix.view . 'x <plug>(fzf-maps-x)'
  execute 'omap <silent> '. key_prefix.view . 'o <plug>(fzf-maps-o)'
  " Insert mode completion
  execute 'imap <silent> '. key_prefix.win . 'w <plug>(fzf-complete-word)'
  execute 'imap <silent> '. key_prefix.win . 'p <plug>(fzf-complete-path)'
  execute 'imap <silent> '. key_prefix.win . 'l <plug>(fzf-complete-line)'
  execute 'imap <silent> '. key_prefix.win . 'f <plug>(fzf-complete-file)'
  " Files (runs $FZF_DEFAULT_COMMAND if defined)
  execute 'nnoremap <silent> '. key_prefix.view . 'f :<C-u>'.command_prefix.'Files<CR>'
  " Git files (git status)
  execute 'nnoremap <silent> '. key_prefix.view . 'g :<C-u>'.command_prefix.'GFiles<CR>'
  " Open buffers
  execute 'nnoremap <silent> '. key_prefix.view . 'b :<C-u>'.command_prefix.'Buffers<CR>'
  " ag search result (ALT-A to select all, ALT-D to deselect all)
  execute 'nnoremap <silent> '. key_prefix.view . 'a :<C-u>'.command_prefix.'Ag<CR>'
  " rg search result (ALT-A to select all, ALT-D to deselect all)
  execute 'nnoremap <silent> '. key_prefix.view . 'r :<C-u>'.command_prefix.'Rg<CR>'
  " Lines in loaded buffers
  execute 'nnoremap <silent> '. key_prefix.view . 'l :<C-u>'.command_prefix.'Lines<CR>'
  " Windows
  execute 'nnoremap <silent> '. key_prefix.view . 'w :<C-u>'.command_prefix.'Windows<CR>'
  " Marks
  execute 'nnoremap <silent> '. key_prefix.view . 'm :<C-u>'.command_prefix.'Marks<CR>'
  " v:oldfiles and open buffers
  execute 'nnoremap <silent> '. key_prefix.view . 'o :<C-u>'.command_prefix.'History<CR>'
  " Help tags
  execute 'nnoremap <silent> '. key_prefix.view . 'h :<C-u>'.command_prefix.'Helptags<CR>'
  if has_key(materia#conf('packages'), 'vim_fugitive')
    " Git commits (requires fugitive.vim)
    execute 'nnoremap <silent> '. key_prefix.view . 'c :<C-u>'.command_prefix.'Commits<CR>'
  endif

  autocmd! FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

  " Override statusline as you like
  function! s:fzf_statusline()
    highlight fzf1 ctermfg=161 ctermbg=251
    highlight fzf2 ctermfg=23 ctermbg=251
    highlight fzf3 ctermfg=237 ctermbg=251
    setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
  endfunction
  autocmd! User FzfStatusLine call <SID>fzf_statusline()

  " Customizing Files command
  let preview_options = materia#conf('packages.fzf_vim.preview_options')
  command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(preview_options), <bang>0)

endfunction

function! s:fzf_vim.install(install)
  call a:install('junegunn/fzf', { 'do': 'call fzf#install()' })
  call a:install('junegunn/fzf.vim')
endfunction

call materia#packages#add_package('fzf_vim', s:fzf_vim)

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
call materia#packages#add_package('vim_interestingwords', s:vim_interestingwords)

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
call materia#packages#add_package('vim_visualstar', s:vim_visualstar)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => far
" Find And Replace Vim plugin
" https://github.com/brooth/far.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:far = {}
function! s:far.option()
  " improve scrolling performance when navigating through large results
  set lazyredraw
  " ignore case only when the pattern contains no capital letters
  set ignorecase smartcase
endfunction
function! s:far.listener()
  " shortcut for far.vim find
  nnoremap <silent> <Find-Shortcut>  :Farf<cr>
  vnoremap <silent> <Find-Shortcut>  :Farf<cr>
  " shortcut for far.vim replace
  nnoremap <silent> <Replace-Shortcut>  :Farr<cr>
  vnoremap <silent> <Replace-Shortcut>  :Farr<cr>
endfunction
function! s:far.install(install)
  call a:install('brooth/far.vim')
endfunction
call materia#packages#add_package('far', s:far)
