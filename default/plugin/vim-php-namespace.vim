"=============================================================================
" FILE: vim-php-namespace.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" vim-php-namespace is a vim plugin for inserting "use" statements automatically.
" https://github.com/arnaud-lb/vim-php-namespace
"=============================================================================

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function ListenerPlugLoadedVimPhpNamespace()
  if HasPlug('onehalf') && HasPlug('vim-airline')
    colorscheme onehalfdark
    let g:airline_theme='onehalfdark'
    call airline#switch_theme('onehalfdark')
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => trigger
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PlugOptionDoVimPhpNamespace(info = {})
  call ListenerPlugLoadedVimPhpNamespace()
endfunction


Plug 'arnaud-lb/vim-php-namespace', { 'do': function('PlugOptionDoVimPhpNamespace') }
