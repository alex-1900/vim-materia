"=============================================================================
" FILE: vim_nerdtree_syntax_highlight.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" This adds syntax for nerdtree on most common file extensions.
" https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_nerdtree_syntax_highlight#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_nerdtree_syntax_highlight#config()
  " Disable unmatched folder and file icons having the same color as their labels
  let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
  let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1
  " Disable uncommon file extensions highlighting (this is a good idea if you are experiencing lag when scrolling. Find more about lag on next session.)
  let g:NERDTreeLimitedSyntax = 1
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_nerdtree_syntax_highlight#listener()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_nerdtree_syntax_highlight#install(install)
  call a:install('tiagofumo/vim-nerdtree-syntax-highlight')
endfunction
