"=============================================================================
" FILE: docker_file.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc_nvim
" https://github.com/neoclide/coc.nvim
" https://github.com/neoclide/coc.nvim/blob/master/data/schema.json
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let coc_nvim = {'id': 'coc_nvim', 'directory': 'coc.nvim'}

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

function! coc_nvim.preloader()
  " options
  set shortmess+=c
  set updatetime=300
endfunction

function! coc_nvim.loader()
  " Mappings for CoCList
  " GoTo code navigation.
  let key_prefix = GetConfigMapPrefix(materia#config#get('key.coding'))
  execute 'nmap <silent> '. key_prefix.reader .'d <Plug>(coc-definition)'
  execute 'nmap <silent> '. key_prefix.reader .'t <Plug>(coc-type-definition)'
  execute 'nmap <silent> '. key_prefix.reader .'i <Plug>(coc-implementation)'
  execute 'nmap <silent> '. key_prefix.reader .'r <Plug>(coc-references)'
  execute 'nmap <silent> '. key_prefix.reader .'u <Plug>(coc-references-used)'
  execute 'nmap <silent> '. key_prefix.state .'l <Plug>(coc-openlink)'
  " Formatting selected code.
  execute 'xmap <silent> '. key_prefix.writer .'f <Plug>(coc-format-selected)'
  " Symbol renaming.
  execute 'nmap <silent> '. key_prefix.writer .'n <Plug>(coc-rename)'
  " Apply AutoFix to problem on the current line.
  execute 'nmap <silent> '. key_prefix.writer .'q <Plug>(coc-fix-current)'
  " Open a new vsplit window for refactor
  execute 'nmap <silent> '. key_prefix.state .'r <Plug>(coc-refactor)'
  " Format selected codes
  execute 'vmap <silent> '. key_prefix.writer .'m <Plug>(coc-format-selected)'
  " Format current buffer codes
  execute 'nmap <silent> '. key_prefix.writer .'m <Plug>(coc-format)'
  " Show all diagnostics.
  execute 'nnoremap <silent><nowait> '. key_prefix.reader .'a :<C-u>CocList diagnostics<cr>'
  " Manage extensions.
  execute 'nnoremap <silent><nowait> '. key_prefix.reader .'e :<C-u>CocList extensions<cr>'
  " Show commands.
  execute 'nnoremap <silent><nowait> '. key_prefix.reader .'c :<C-u>CocList commands<cr>'
  " Find symbol of current document.
  execute 'nnoremap <silent><nowait> '. key_prefix.reader .'o :<C-u>CocList outline<cr>'
  " Search workspace symbols.
  execute 'nnoremap <silent><nowait> '. key_prefix.reader .'s :<C-u>CocList -I symbols<cr>'
  " Do default action for next item.
  execute 'nnoremap <silent><nowait> '. key_prefix.next .'c :<C-u>CocNext<cr>'
  " Do default action for previous item.
  execute 'nnoremap <silent><nowait> '. key_prefix.prev .'c :<C-u>CocPrev<cr>'
  " Resume latest coc list.
  execute 'nnoremap <silent><nowait> '. key_prefix.reader .'m :<C-u>CocListResume<cr>'
  " Show documentation in preview window.
  execute 'nnoremap <silent> '. key_prefix.reader .'p :call <SID>show_documentation()<CR>'
  " Requires 'textDocument/selectionRange' support of language server.
  execute 'nmap <silent> '. key_prefix.writer .'s <Plug>(coc-range-select)'
  execute 'xmap <silent> '. key_prefix.writer .'s <Plug>(coc-range-select)'
  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  execute 'xmap <silent> '. key_prefix.writer .'if <Plug>(coc-funcobj-i)'
  execute 'omap <silent> '. key_prefix.writer .'if <Plug>(coc-funcobj-i)'
  execute 'xmap <silent> '. key_prefix.writer .'af <Plug>(coc-funcobj-a)'
  execute 'omap <silent> '. key_prefix.writer .'af <Plug>(coc-funcobj-a)'
  execute 'xmap <silent> '. key_prefix.writer .'ic <Plug>(coc-classobj-i)'
  execute 'omap <silent> '. key_prefix.writer .'ic <Plug>(coc-classobj-i)'
  execute 'xmap <silent> '. key_prefix.writer .'ac <Plug>(coc-classobj-a)'
  execute 'omap <silent> '. key_prefix.writer .'ac <Plug>(coc-classobj-a)'
  execute 'omap <silent> '. key_prefix.writer .'co <Plug>(coc-cursors-operator)'
  execute 'omap <silent> '. key_prefix.writer .'cr <Plug>(coc-cursors-range)'
  execute 'omap <silent> '. key_prefix.writer .'cw <Plug>(coc-cursors-word)'
  execute 'omap <silent> '. key_prefix.writer .'cp <Plug>(coc-cursors-position)'
  " Trigger completion.
  execute 'inoremap <silent><expr> '. key_prefix.win .'r coc#refresh()'
  " Make <CR> auto-select the first completion item and notify coc.nvim to
  " format on enter, <cr> could be remapped by other vim plugin
  inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  " Navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  execute 'nmap <silent> '. key_prefix.prev .'d <Plug>(coc-diagnostic-prev)'
  execute 'nmap <silent> '. key_prefix.next .'d <Plug>(coc-diagnostic-next)'
  " Remap <C-f> and <C-b> for scroll float windows/popups.
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    execute 'nnoremap <silent><nowait><expr> '. key_prefix.win .'f coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"'
    execute 'nnoremap <silent><nowait><expr> '. key_prefix.win .'b coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"'
    execute 'inoremap <silent><nowait><expr> '. key_prefix.win .'f coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"'
    execute 'inoremap <silent><nowait><expr> '. key_prefix.win .'b coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"'
    execute 'vnoremap <silent><nowait><expr> '. key_prefix.win .'f coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"'
    execute 'vnoremap <silent><nowait><expr> '. key_prefix.win .'b coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"'
  endif

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocActionAsync('format')
  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call CocActionAsync('fold', <f-args>)
  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR :call CocActionAsync('runCommand', 'editor.action.organizeImport')

  augroup materia_cocgroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end
  " let g:coc_global_extensions = ['coc-phpls', 'coc-git', 'coc-html', 'coc-css', 'coc-vimlsp', 'coc-python']
  autocmd CursorHold * silent call CocActionAsync('highlight')
endfunction

function! coc_nvim.installer(install)
  call a:install('neoclide/coc.nvim', { 'branch': 'release' })
endfunction

call materia#part#add(coc_nvim)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc_clangd
" clangd extension for coc.nvim
" https://github.com/clangd/coc-clangd
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let coc_clangd = {
  \ 'id': 'coc_clangd',
  \ 'directory': 'coc-clangd',
  \ 'includes': ['coc_nvim']
\ }
function! coc_clangd.installer(install)
  call a:install('neoclide/coc.nvim', { 'branch': 'release' })
  call a:install('clangd/coc-clangd', {
    \ 'do': "yarn install --frozen-lockfile"
  \ })
endfunction
call materia#part#add(coc_clangd)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc_css
" https://github.com/neoclide/coc-css
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let coc_css = {
  \ 'id': 'coc_css',
  \ 'directory': 'coc-css',
  \ 'includes': ['coc_nvim']
\ }
function! coc_css.installer(install)
  call a:install('neoclide/coc-css', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#part#add(coc_css)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc_git
" https://github.com/neoclide/coc-git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let coc_git = {'id': 'coc_git', 'directory': 'coc-git', 'includes': ['coc_nvim']}
function! coc_git.installer(install)
  call a:install('neoclide/coc-git', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#part#add(coc_git)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc_go
" https://github.com/josa42/coc-go
" Coexists with `fatih/vim-go` by default
" See: Part `vim_go`
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let coc_go = {'id': 'coc_go', 'directory': 'coc-go', 'includes': ['coc_nvim']}
function! coc_go.loader()
  " Fixed organize import action not found
  autocmd FileType go call coc#config('coc.preferences', { 'messageLevel': 'error' })
  " use `:OR` for organize import of current buffer
  if materia#config#get('parts.coc_go.imports_autosave')
    autocmd BufWritePre *.go if !get(g:, 'go_imports_autosave', 0) | call CocAction('runCommand', 'editor.action.organizeImport') | endif
  endif
  if materia#config#get('parts.coc_go.fmt_autosave')
    autocmd BufWritePre *.go if !get(g:, 'go_fmt_autosave', 0) | call CocAction('format') | endif
  endif
endfunction
function! coc_go.installer(install)
  call a:install('josa42/coc-go', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#part#add(coc_go)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc_html
" https://github.com/neoclide/coc-html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let coc_html = {'id': 'coc_html', 'directory': 'coc-html', 'includes': ['coc_nvim']}
function! coc_html.installer(install)
  call a:install('neoclide/coc-html', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#part#add(coc_html)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc_json
" https://github.com/neoclide/coc-json
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let coc_json = {'id': 'coc_json', 'directory': 'coc-json', 'includes': ['coc_nvim']}
function! coc_json.preloader()
  execute 'set conceallevel='. materia#config#get('parts.coc_json.conceallevel')
endfunction
function! coc_json.installer(install)
  call a:install('neoclide/coc-json', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#part#add(coc_json)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc_phpls
" https://github.com/marlonfan/coc-phpls
" https://github.com/marlonfan/coc-phpls/issues/41#issuecomment-570176547
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let coc_phpls = {'id': 'coc_phpls', 'directory': 'coc-phpls', 'includes': ['coc_nvim']}
function! coc_phpls.installer(install)
  call a:install('marlonfan/coc-phpls', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#part#add(coc_phpls)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc_tsserver
" https://github.com/neoclide/coc-tsserver
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let coc_tsserver = {
  \ 'id': 'coc_tsserver',
  \ 'directory': 'coc-tsserver',
  \ 'includes': ['coc_nvim', 'typescript_vim', 'typescript_vim']
\ }
function! coc_tsserver.installer(install)
  call a:install('neoclide/coc-tsserver', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#part#add(coc_tsserver)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc_vimlsp
" https://github.com/iamcco/coc-vimlsp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let coc_vimlsp = {'id': 'coc_vimlsp', 'directory': 'coc-vimlsp', 'includes': ['coc_nvim']}
function! coc_vimlsp.installer(install)
  call a:install('iamcco/coc-vimlsp', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#part#add(coc_vimlsp)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc_yaml
" https://github.com/neoclide/coc-yaml
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let coc_yaml = {'id': 'coc_yaml', 'directory': 'coc-yaml', 'includes': ['coc_nvim']}
function! coc_yaml.installer(install)
  call a:install('neoclide/coc-yaml', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#part#add(coc_yaml)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc_pyright
" https://github.com/fannheyward/coc-pyright
"
" Note: `coc-python` has been archived by the owner.
" https://github.com/neoclide/coc-python#coc-python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let coc_pyright = {'id': 'coc_pyright', 'directory': 'coc-pyright', 'includes': ['coc_nvim']}
function! coc_pyright.installer(install)
  call a:install('fannheyward/coc-pyright', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#part#add(coc_pyright)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc_emmet
" Emmet extension for coc.nvim
" https://github.com/neoclide/coc-emmet
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let coc_emmet = {
  \ 'id': 'coc_emmet',
  \ 'directory': 'coc-emmet',
  \ 'includes': ['emmet_vim']
\ }
function! coc_emmet.installer(install)
  call a:install('neoclide/coc-emmet', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#part#add(coc_emmet)
