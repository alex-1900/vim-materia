"=============================================================================
" FILE: vim_startify.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" descripion
" https://github.com/mhinz/vim-startify
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_startify#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_startify#config()
  let g:startify_change_to_vcs_root = 1
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
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_startify#listener()
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
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_startify#install(install)
  call a:install('mhinz/vim-startify')
endfunction
