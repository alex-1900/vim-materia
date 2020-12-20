"=============================================================================
" FILE: vim_floaterm.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" Use (neo)vim terminal in the floating/popup window.
" https://github.com/voldikss/vim-floaterm
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_floaterm#options()
  " Set floaterm window's background to black
  hi Floaterm guibg=black
  " Set floating window border line color to cyan, and background to orange
  hi FloatermBorder guibg=orange guifg=cyan
  " Set floaterm window background to gray once the cursor moves out from it
  hi FloatermNC guibg=gray
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_floaterm#config()
  let g:floaterm_keymap_new = '<Leader>tn'
  let g:floaterm_keymap_prev = '<Leader>th'
  let g:floaterm_keymap_next = '<Leader>tl'
  let g:floaterm_keymap_toggle = '<leader>tt'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_floaterm#listener()
  tnoremap <silent> <leader>tk <C-\><C-n>:FloatermKill<CR>
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_floaterm#install(install)
  call a:install('voldikss/vim-floaterm')
endfunction
