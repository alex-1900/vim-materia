"=============================================================================
" FILE: coc.nvim.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" True snippet and additional text editing support.
" https://github.com/neoclide/coc.nvim
"=============================================================================

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ListenerPlugLoadedCoc()
  if !HasPlug('coc.nvim')
    return 0
  endif

  " Mappings for CoCList
  " GoTo code navigation.
  nmap <silent> <space>d <Plug>(coc-definition)
  nmap <silent> <space>r <Plug>(coc-references)
  " Formatting selected code.
  xnoremap <space>cf  <Plug>(coc-format-selected)
  nnoremap <space>cf  <Plug>(coc-format-selected)
  " Apply AutoFix to problem on the current line.
  nnoremap <space>cv  <Plug>(coc-fix-current)
  " Show all diagnostics.
  nnoremap <silent><nowait> <space>ca  :<C-u>CocList diagnostics<cr>
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
  nnoremap <silent><nowait> <space>cp  :<C-u>CocListResume<CR>

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


  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => trigger
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PlugOptionDoCocNvim(...)
  call ListenerPlugLoadedCoc()
endfunction

Plug 'neoclide/coc.nvim', {
  \ 'branch': 'release',
  \ 'do': function('PlugOptionDoCocNvim')
\ }

call AutocmdAmPlugLoaded('ListenerPlugLoadedCoc')
