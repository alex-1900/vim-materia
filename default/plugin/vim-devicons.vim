"=============================================================================
" FILE: vim-devicons.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" Adds filetype glyphs (icons) to various vim plugins.
" https://github.com/ryanoasis/vim-devicons
"=============================================================================

let g:webdevicons_enable = 1

if !automemories#platform#gui()
  let g:webdevicons_enable = 0
endif

Plug 'ryanoasis/vim-devicons'
