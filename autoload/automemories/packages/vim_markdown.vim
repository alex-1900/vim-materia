"=============================================================================
" FILE: vim_markdown.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" This is the development version of Vim's included syntax highlighting and filetype plugins for Markdown.
" https://github.com/tpope/vim-markdown
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_markdown#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_markdown#config()
  let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_markdown#listener()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_markdown#install(install)
  call a:install('tpope/vim-markdown')
endfunction
