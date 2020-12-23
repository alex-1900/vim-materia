"=============================================================================
" FILE: docker_file.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" https://github.com/neoclide/coc.nvim/blob/master/data/schema.json
" https://github.com/neoclide/coc.nvim
" https://github.com/neoclide/coc-css
" https://github.com/neoclide/coc-git
" https://github.com/josa42/coc-go
" https://github.com/neoclide/coc-html
" https://github.com/neoclide/coc-json
" https://github.com/marlonfan/coc-phpls
" https://github.com/neoclide/coc-tsserver
" https://github.com/iamcco/coc-vimlsp
" https://github.com/neoclide/coc-yaml
" https://github.com/neoclide/coc-python
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc_nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:coc_nvim = {}

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

function! s:coc_nvim.options()
  set shortmess+=c
  set updatetime=300
endfunction

function! s:coc_nvim.listener()
  " Mappings for CoCList
  " GoTo code navigation.
  nmap <silent> <leader>cd <Plug>(coc-definition)
  nmap <silent> <leader>ct <Plug>(coc-type-definition)
  nmap <silent> <leader>ci <Plug>(coc-implementation)
  nmap <silent> <leader>cr <Plug>(coc-references)
  " Formatting selected code.
  xmap <leader>cf <Plug>(coc-format-selected)
  nmap <leader>cf <Plug>(coc-format-selected)
  " Symbol renaming.
  nmap <leader>ln <Plug>(coc-rename)
  " Apply AutoFix to problem on the current line.
  nmap <leader>lv <Plug>(coc-fix-current)

  " Mappings for CoCList
  " Show all diagnostics.
  nnoremap <silent><nowait> <space>ca :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  nnoremap <silent><nowait> <space>ce  :<C-u>CocList extensions<cr>
  " Show commands.
  nnoremap <silent><nowait> <space>cc  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <silent><nowait> <space>co  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <silent><nowait> <space>cs  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent><nowait> <space>cj  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent><nowait> <space>ck  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <silent><nowait> <space>cm  :<C-u>CocListResume<CR>

  " Use CTRL-S for selections ranges.
  " Requires 'textDocument/selectionRange' support of language server.
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  " Remap <C-f> and <C-b> for scroll float windows/popups.
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <space>cf coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <space>cb coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <space>cf coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <space>cb coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <space>cf coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <space>cb coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  endif


  " let g:coc_global_extensions = ['coc-phpls', 'coc-git', 'coc-html', 'coc-css', 'coc-vimlsp', 'coc-python']

  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  " Make <CR> auto-select the first completion item and notify coc.nvim to
  " format on enter, <cr> could be remapped by other vim plugin
  inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')
  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)
  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'code.action.organizeImport')

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Use K to show documentation in preview window.
  nnoremap <silent> KK :call <SID>show_documentation()<CR>
endfunction

function! s:coc_nvim.install(install)
  call a:install('neoclide/coc.nvim', { 'branch': 'release' })
endfunction

call materia#modules#add_package('coc_nvim', s:coc_nvim)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc_css
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:coc_css = {}
function! s:coc_css.install(install)
  call a:install('neoclide/coc-css', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#modules#add_package('coc_css', s:coc_css)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc_git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:coc_git = {}
function! s:coc_git.install(install)
  call a:install('neoclide/coc-git', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#modules#add_package('coc_git', s:coc_git)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc_go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:coc_go = {}
function! s:coc_go.listener()
  " use `:OR` for organize import of current buffer
  command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
  autocmd BufWritePre *.go :OR
  " Fixed organize import action not found
  call coc#config('coc.preferences', {
    \ 'messageLevel': 'error',
  \})
  autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
  autocmd FileType go nmap gty :CocCommand go.tags.add yaml<cr>
  autocmd FileType go nmap gtx :CocCommand go.tags.clear<cr>
endfunction
function! s:coc_go.install(install)
  call a:install('josa42/coc-go', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#modules#add_package('coc_go', s:coc_go)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc_html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:coc_html = {}
function! s:coc_html.install(install)
  call a:install('neoclide/coc-html', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#modules#add_package('coc_html', s:coc_html)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc_json
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:coc_json = {}
function! s:coc_json.options()
  set conceallevel=0
endfunction
function! s:coc_json.install(install)
  call a:install('neoclide/coc-json', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#modules#add_package('coc_json', s:coc_json)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc_phpls
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:coc_phpls = {}
function! s:coc_phpls.install(install)
  call a:install('marlonfan/coc-phpls', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#modules#add_package('coc_phpls', s:coc_phpls)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc_tsserver
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:coc_tsserver = {}
function! s:coc_tsserver.install(install)
  call a:install('neoclide/coc-tsserver', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#modules#add_package('coc_tsserver', s:coc_tsserver)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc_vimlsp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:coc_vimlsp = {}
function! s:coc_vimlsp.install(install)
  call a:install('iamcco/coc-vimlsp', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#modules#add_package('coc_vimlsp', s:coc_vimlsp)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc_yaml
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:coc_yaml = {}
function! s:coc_yaml.install(install)
  call a:install('neoclide/coc-yaml', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#modules#add_package('coc_yaml', s:coc_yaml)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc_python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:coc_python = {}
function! s:coc_python.install(install)
  call a:install('neoclide/coc-python', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#modules#add_package('coc_python', s:coc_python)
