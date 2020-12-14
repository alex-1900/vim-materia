"=============================================================================
" FILE: vim-gitgutter.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" A Vim plugin which shows a git diff in the sign column.
" https://github.com/airblade/vim-gitgutter
"=============================================================================

let g:gitgutter_max_signs = -1
highlight! link SignColumn LineNr
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

Plug 'airblade/vim-gitgutter'
