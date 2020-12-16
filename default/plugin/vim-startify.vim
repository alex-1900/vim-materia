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
" sessions path
let g:startify_session_dir = automemories#homepath('/sessions')

let g:startify_lists = [
  \ { 'type': 'files',     'header': ['   Files']            },
  \ { 'type': 'dir',       'header': ['   Dirs '. getcwd()] },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'commands',  'header': ['   Commands']       },
\ ]

function! ListenerLoadedPlugStartify()
  if HasPlug('vim-startify')
    autocmd BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) | Startify | endif
    if has('nvim')
      autocmd TabNewEntered * Startify
    else
      autocmd BufWinEnter *
        \ if !exists('t:startify_new_tab')
        \     && empty(expand('%'))
        \     && empty(&l:buftype)
        \     && &l:modifiable |
        \   let t:startify_new_tab = 1 |
        \   Startify |
        \ endif

    autocmd BufEnter *
        \ if !exists('t:startify_new_tab') && empty(expand('%')) && !exists('t:goyo_master') | 
        \   let t:startify_new_tab = 1 |
        \   Startify |
        \ endif
    endif
  endif
endfunction

function! PlugOptionDoStartify(info = {})
  call ListenerLoadedPlugStartify() | q | Startify
endfunction

Plug 'mhinz/vim-startify', { 'do': function('PlugOptionDoStartify') }
