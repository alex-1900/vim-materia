"=============================================================================
" FILE: editorconfig_vim.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" This is an EditorConfig plugin for Vim. This plugin can be found on both GitHub and Vim online.
" https://github.com/editorconfig/editorconfig-vim
" https://editorconfig.org/
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#editorconfig_vim#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#editorconfig_vim#config()
  let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#editorconfig_vim#listener()
  autocmd FileType gitcommit let b:EditorConfig_disable = 1
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#editorconfig_vim#install(install)
  call a:install('editorconfig/editorconfig-vim')
endfunction
