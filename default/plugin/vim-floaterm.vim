"=============================================================================
" FILE: auto-pairs.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" Use (neo)vim terminal in the floating/popup window.
" https://github.com/voldikss/vim-floaterm
"=============================================================================

let g:floaterm_keymap_new = '<Leader>tn'
let g:floaterm_keymap_prev = '<Leader>th'
let g:floaterm_keymap_next = '<Leader>tl'
let g:floaterm_keymap_toggle = '<leader>tt'

tnoremap <silent> <leader>tk <C-\><C-n>:FloatermKill<CR>

" Set floaterm window's background to black
hi Floaterm guibg=black
" Set floating window border line color to cyan, and background to orange
hi FloatermBorder guibg=orange guifg=cyan
" Set floaterm window background to gray once the cursor moves out from it
hi FloatermNC guibg=gray

Plug 'voldikss/vim-floaterm'
