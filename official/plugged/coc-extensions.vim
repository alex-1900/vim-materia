"=============================================================================
" FILE: ctrlp.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" coc extensions
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
" https://github.com/marlonfan/coc-phpls
" https://github.com/neoclide/coc-html
" https://github.com/neoclide/coc-css
" https://github.com/neoclide/coc-git
"=============================================================================

Plug 'marlonfan/coc-phpls', { 'for': ['php'], 'do': 'yarn install --frozen-lockfile' }

Plug 'neoclide/coc-html', { 'for': ['html'], 'do': 'yarn install --frozen-lockfile' }


function! ListenerPlugLoadedCocCss(info = {})
  set iskeyword+=@
  autocmd FileType scss setl iskeyword+=@-@
endfunction
Plug 'neoclide/coc-css', { 'for': ['css', 'scss'], 'do': 'yarn install --frozen-lockfile' }
autocmd! User coc-css call ListenerPlugLoadedCocCss()

Plug 'neoclide/coc-git', { 'do': 'yarn install --frozen-lockfile' }
