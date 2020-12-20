"=============================================================================
" FILE: html.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" emmet-vim is a vim plug-in which provides support for expanding abbreviations similar to emmet.
" https://github.com/mattn/emmet-vim
"
" snippets.json Doc:
" https://docs.emmet.io/customization/snippets/
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#emmet_vim#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#emmet_vim#config()
  " emmet-vim
  if exists('g:automemories#config.html.snippet_path')
    let s:snippet_path = g:automemories#config.html.snippet_path
    let g:user_emmet_settings = webapi#json#decode(join(readfile(expand(s:snippet_path)), "\n"))
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#emmet_vim#listener()
  autocmd FileType html,css EmmetInstall
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#emmet_vim#install(install)
  call a:install('mattn/emmet-vim')
endfunction
