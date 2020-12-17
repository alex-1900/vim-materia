"=============================================================================
" FILE: ctrlp.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" For npm error `npm install with error: `gyp` failed with exit code: 1` on MacOs:
" https://stackoverflow.com/questions/49348482/npm-install-with-error-gyp-failed-with-exit-code-1/60860951
"
" coc extensions
" https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
" https://github.com/marlonfan/coc-phpls
" https://github.com/neoclide/coc-html
" https://github.com/neoclide/coc-css
" https://github.com/neoclide/coc-git
" https://github.com/iamcco/coc-vimlsp
" https://github.com/neoclide/coc-python
"
" Intelephense autoindex: `:CocCommand intelephense.index.workspace`
" https://github.com/marlonfan/coc-phpls/issues/46
"=============================================================================

Plug 'marlonfan/coc-phpls', { 'do': 'yarn install --frozen-lockfile' }

Plug 'neoclide/coc-html', { 'do': 'yarn install --frozen-lockfile' }

Plug 'neoclide/coc-css', { 'do': 'yarn install --frozen-lockfile' }

Plug 'neoclide/coc-git', { 'do': 'yarn install --frozen-lockfile' }

Plug 'iamcco/coc-vimlsp', { 'do': 'yarn install --frozen-lockfile' }

Plug 'neoclide/coc-python', { 'do': 'yarn install --frozen-lockfile' }
