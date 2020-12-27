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
  let key_prefix = GetConfigMapPrefix(materia#conf('packages.coc_nvim.basekey'))
  execute 'nmap <silent> '. key_prefix.view .'d <Plug>(coc-definition)'
  execute 'nmap <silent> '. key_prefix.view .'t <Plug>(coc-type-definition)'
  execute 'nmap <silent> '. key_prefix.view .'i <Plug>(coc-implementation)'
  execute 'nmap <silent> '. key_prefix.view .'r <Plug>(coc-references)'
  " Formatting selected code.
  execute 'xmap <silent> '. key_prefix.action .'f <Plug>(coc-format-selected)'
  execute 'nmap <silent> '. key_prefix.action .'f <Plug>(coc-format-selected)'
  " Symbol renaming.
  execute 'nmap <silent> '. key_prefix.action .'n <Plug>(coc-rename)'
  " Apply AutoFix to problem on the current line.
  execute 'nmap <silent> '. key_prefix.action .'v <Plug>(coc-fix-current)'

  " Mappings for CoCList
  " Show all diagnostics.
  execute 'nnoremap <silent><nowait> '. key_prefix.view .'a :<C-u>CocList diagnostics<cr>'
  " Manage extensions.
  execute 'nnoremap <silent><nowait> '. key_prefix.view .'e :<C-u>CocList extensions<cr>'
  " Show commands.
  execute 'nnoremap <silent><nowait> '. key_prefix.view .'c :<C-u>CocList commands<cr>'
  " Find symbol of current document.
  execute 'nnoremap <silent><nowait> '. key_prefix.view .'o :<C-u>CocList outline<cr>'
  " Search workspace symbols.
  execute 'nnoremap <silent><nowait> '. key_prefix.view .'s :<C-u>CocList -I symbols<cr>'
  " Do default action for next item.
  execute 'nnoremap <silent><nowait> '. key_prefix.next .'c :<C-u>CocNext<cr>'
  " Do default action for previous item.
  execute 'nnoremap <silent><nowait> '. key_prefix.prev .'c :<C-u>CocPrev<cr>'
  " Resume latest coc list.
  execute 'nnoremap <silent><nowait> '. key_prefix.view .'m :<C-u>CocListResume<cr>'

  " Use CTRL-S for selections ranges.
  " Requires 'textDocument/selectionRange' support of language server.
  execute 'nmap <silent> '. key_prefix.action .'s <Plug>(coc-range-select)'
  execute 'xmap <silent> '. key_prefix.action .'s <Plug>(coc-range-select)'

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  execute 'xmap <silent> '. key_prefix.action .'if <Plug>(coc-funcobj-i)'
  execute 'omap <silent> '. key_prefix.action .'if <Plug>(coc-funcobj-i)'
  execute 'xmap <silent> '. key_prefix.action .'af <Plug>(coc-funcobj-a)'
  execute 'omap <silent> '. key_prefix.action .'af <Plug>(coc-funcobj-a)'
  execute 'xmap <silent> '. key_prefix.action .'ic <Plug>(coc-classobj-i)'
  execute 'omap <silent> '. key_prefix.action .'ic <Plug>(coc-classobj-i)'
  execute 'xmap <silent> '. key_prefix.action .'ac <Plug>(coc-classobj-a)'
  execute 'omap <silent> '. key_prefix.action .'ac <Plug>(coc-classobj-a)'

  " Remap <C-f> and <C-b> for scroll float windows/popups.
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    execute 'nnoremap <silent><nowait><expr> '. key_prefix.win .'f coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"'
    execute 'nnoremap <silent><nowait><expr> '. key_prefix.win .'b coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"'
    execute 'inoremap <silent><nowait><expr> '. key_prefix.win .'f coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"'
    execute 'inoremap <silent><nowait><expr> '. key_prefix.win .'b coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"'
    execute 'vnoremap <silent><nowait><expr> '. key_prefix.win .'f coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"'
    execute 'vnoremap <silent><nowait><expr> '. key_prefix.win .'b coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"'
  endif


  " let g:coc_global_extensions = ['coc-phpls', 'coc-git', 'coc-html', 'coc-css', 'coc-vimlsp', 'coc-python']

  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Use <C-c>r to trigger completion.
  execute 'inoremap <silent><expr> '. key_prefix.win .'r coc#refresh()'

  " Make <CR> auto-select the first completion item and notify coc.nvim to
  " format on enter, <cr> could be remapped by other vim plugin
  inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  execute 'nmap <silent> '. key_prefix.prev .'d <Plug>(coc-diagnostic-prev)'
  execute 'nmap <silent> '. key_prefix.next .'d <Plug>(coc-diagnostic-next)'

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')
  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)
  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocAction('runCommand', 'code.action.organizeImport')

  augroup materia_cocgroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Use K to show documentation in preview window.
  execute 'nnoremap <silent> '. key_prefix.view .'p :call <SID>show_documentation()<CR>'
endfunction

function! s:coc_nvim.install(install)
  call a:install('neoclide/coc.nvim', { 'branch': 'release' })
endfunction

call materia#packages#add_package('coc_nvim', s:coc_nvim)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc_css
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:coc_css = {}
function! s:coc_css.install(install)
  call a:install('neoclide/coc-css', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#packages#add_package('coc_css', s:coc_css)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc_git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:coc_git = {}
function! s:coc_git.install(install)
  call a:install('neoclide/coc-git', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#packages#add_package('coc_git', s:coc_git)

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
call materia#packages#add_package('coc_go', s:coc_go)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc_html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:coc_html = {}
function! s:coc_html.install(install)
  call a:install('neoclide/coc-html', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#packages#add_package('coc_html', s:coc_html)

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
call materia#packages#add_package('coc_json', s:coc_json)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc_phpls
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:coc_phpls = {}
function! s:coc_phpls.install(install)
  call a:install('marlonfan/coc-phpls', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#packages#add_package('coc_phpls', s:coc_phpls)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc_tsserver
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:coc_tsserver = {}
function! s:coc_tsserver.install(install)
  call a:install('neoclide/coc-tsserver', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#packages#add_package('coc_tsserver', s:coc_tsserver)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc_vimlsp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:coc_vimlsp = {}
function! s:coc_vimlsp.install(install)
  call a:install('iamcco/coc-vimlsp', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#packages#add_package('coc_vimlsp', s:coc_vimlsp)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc_yaml
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:coc_yaml = {}
function! s:coc_yaml.install(install)
  call a:install('neoclide/coc-yaml', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#packages#add_package('coc_yaml', s:coc_yaml)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => coc_python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:coc_python = {}
function! s:coc_python.install(install)
  call a:install('neoclide/coc-python', { 'do': 'yarn install --frozen-lockfile' })
endfunction
call materia#packages#add_package('coc_python', s:coc_python)
