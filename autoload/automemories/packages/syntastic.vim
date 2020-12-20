"=============================================================================
" FILE: syntastic.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" Syntastic is a syntax checking plugin for Vim created by Martin Grenfell.
" It runs files through external syntax checkers and displays any resulting errors to the user.
" https://github.com/vim-syntastic/syntastic
"
"               ,
"              / \,,_  .'|
"           ,{{| /}}}}/_.'            _____________________________________________
"          }}}}` '{{'  '.            /                                             \
"        {{{{{    _   ;, \          /            Ladies and Gentlemen,              \
"     ,}}}}}}    /o`\  ` ;)        |                                                |
"    {{{{{{   /           (        |                 this is ...                    |
"    }}}}}}   |            \       |                                                |
"   {{{{{{{{   \            \      |                                                |
"   }}}}}}}}}   '.__      _  |     |    _____             __             __  _      |
"   {{{{{{{{       /`._  (_\ /     |   / ___/__  ______  / /_____ ______/ /_(_)____ |
"    }}}}}}'      |    //___/   --=:   \__ \/ / / / __ \/ __/ __ `/ ___/ __/ / ___/ |
"    `{{{{`       |     '--'       |  ___/ / /_/ / / / / /_/ /_/ (__  ) /_/ / /__   |
"     }}}`                         | /____/\__, /_/ /_/\__/\__,_/____/\__/_/\___/   |
"                                  |      /____/                                    |
"                                  |                                               /
"                                   \_____________________________________________/
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#syntastic#options()
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#syntastic#config()
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#syntastic#listener()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#syntastic#install(install)
  call a:install('vim-syntastic/syntastic')
endfunction
