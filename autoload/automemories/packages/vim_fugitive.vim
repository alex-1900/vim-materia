"=============================================================================
" FILE: git.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" Fugitive is the premier Vim plugin for Git. Or maybe it's the premier Git plugin for Vim?
" https://github.com/tpope/vim-fugitive
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_fugitive#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_fugitive#config()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_fugitive#listener()
  nnoremap <leader>gg :Git --paginate<CR>
  nnoremap <leader>gd :Git diff<CR>
  nnoremap <leader>gl :Git log<CR>
  nnoremap <leader>grl :Git reflog<CR>
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_fugitive#install(install)
  call a:install('tpope/vim-fugitive')
endfunction
