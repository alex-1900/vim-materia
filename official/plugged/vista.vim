"=============================================================================
" FILE: vista.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" View and search LSP symbols, tags in Vim/NeoVim.
" https://github.com/liuchengxu/vista.vim
"=============================================================================

let g:vista_sidebar_width = 60
let g:vista#renderer#enable_icon = 1
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#executives = ['coc']
let g:vista_executive_for = {
\ 'php': 'coc', 'html': 'coc', 'css': 'coc'
\ }

function! ListenerPlugLoadedVista()
  nnoremap <leader>v :Vista!!<CR>
endfunction

Plug 'liuchengxu/vista.vim', { 'for': ['php', 'html', 'css'] }

autocmd! User coc.nvim call ListenerPlugLoadedVista()
