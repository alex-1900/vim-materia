"=============================================================================
" FILE: emmet-vim.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" emmet-vim is a vim plug-in which provides support for expanding abbreviations similar to emmet.
" https://github.com/mattn/emmet-vim
"
" An Interface to WEB APIs.
" https://github.com/mattn/webapi-vim
"
" snippets.json Doc:
" https://docs.emmet.io/customization/snippets/
"=============================================================================

let g:user_emmet_install_global = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ListenerPlugLoadedEmmetVim()
  if HasPlug('emmet-vim') && HasPlug('webapi-vim')
    autocmd FileType html,css EmmetInstall
    let s:snippet_path = automemories#getenv('EMMET_SNIPPETS_FILE_PATH')
    if s:snippet_path
      let g:user_emmet_settings = webapi#json#decode(join(readfile(expand(s:snippet_path)), "\n"))
    endif
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => trigger
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PlugOptionDoEmmetVim(...)
  call ListenerPlugLoadedEmmetVim()
endfunction

Plug 'mattn/webapi-vim'
\| Plug 'mattn/emmet-vim', { 'do': function('PlugOptionDoEmmetVim') }

call AutocmdAmPlugLoaded('ListenerPlugLoadedEmmetVim')
