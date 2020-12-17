"=============================================================================
" FILE: vim-visual-multi.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" It's called vim-visual-multi in analogy with visual-block, but the plugin works mostly from normal mode.
" https://github.com/mg979/vim-visual-multi
" https://github.com/mg979/vim-visual-multi/wiki
"=============================================================================

let g:VM_leader = ';'
let g:VM_maps = {}
let g:VM_maps["Add Cursor Down"]    = '<C-j>'
let g:VM_maps["Add Cursor Up"]      = '<C-k>'
let g:VM_maps["Select l"]    = '<C-l>'
let g:VM_maps["Select h"]      = '<C-h>'
let g:VM_maps['Find Under']         = '<C-d>'
let g:VM_maps['Find Subword Under'] = '<C-d>'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}
