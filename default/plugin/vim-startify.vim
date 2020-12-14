"=============================================================================
" FILE: vim-startify.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" This plugin provides a start screen for Vim and Neovim.
" https://github.com/mhinz/vim-startify
"=============================================================================

if !automemories#util#gui()
  let g:webdevicons_enable_startify = 0
endif
let g:startify_change_to_vcs_root = 1

function! ListenerLoadedPlugStartify()
  if HasPlug('vim-startify')
    autocmd BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) | Startify | endif
  endif
endfunction

function! PlugOptionDoStartify(info = {})
  call ListenerLoadedPlugStartify() | q | Startify
endfunction

Plug 'mhinz/vim-startify', { 'do': function('PlugOptionDoStartify') }
