"=============================================================================
" FILE: panel.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" View and search LSP symbols, tags in Vim/NeoVim.
" https://github.com/liuchengxu/vista.vim
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vista_vim#options()
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vista_vim#config()
  " vista.vim
  let g:vista_sidebar_width = 35
  let g:vista#renderer#enable_icon = 1
  let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
  let g:vista#executives = ['coc']
  let g:vista_executive_for = {
  \ 'php': 'coc', 'html': 'coc', 'css': 'coc'
  \ }
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vista_vim#listener()
  nnoremap <leader>v :Vista!!<CR>
  nnoremap <leader>vf :Vista finder<CR>
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vista_vim#install(install)
  call a:install('liuchengxu/vista.vim')
endfunction
