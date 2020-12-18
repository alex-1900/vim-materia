"=============================================================================
" FILE: vim-startify.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" This plugin provides a start screen for Vim and Neovim.
" https://github.com/mhinz/vim-startify
" https://github.com/dylanaraps/neofetch/blob/master/neofetch
"=============================================================================

if !automemories#platform#gui()
  let g:webdevicons_enable_startify = 0
endif
let g:startify_change_to_vcs_root = 1
" sessions path
let g:startify_session_dir = automemories#homepath('/sessions/custom')

let g:startify_ascii = [
\ '                    \',
\ '         , - ~ ^ ~ - \        /',
\ "     , '              \\ ' ,  /",
\ "   ,                   \\   '/",
\ '  ,                     \  / ,',
\ ' ,___,                   \/   ,',
\ ' /   |   _  _  _|_ o     /\   ,',
\ '|,   |  / |/ |  |  |    /  \  ,',
\ ' \,_/\_/  |  |_/|_/|_/_/    \,',
\ "   ,                  /     ,\\",
\ "     ,               /  , '   \\",
\ "      ' - , _ _ _ ,  '"
  \]

let g:startify_custom_header = map(g:startify_ascii, '"     ".v:val')

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

function! PlugOptionDoStartify(...)
  call ListenerLoadedPlugStartify() | q | Startify
endfunction

Plug 'mhinz/vim-startify', { 'do': function('PlugOptionDoStartify') }

call AutocmdAmPlugLoaded('ListenerLoadedPlugStartify')
