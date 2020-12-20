"=============================================================================
" FILE: vim_go.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" https://github.com/josa42/coc-go
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_go#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_go#config()
  let g:go_def_mode='gopls'
  let g:go_info_mode='gopls'
  let g:go_fmt_autosave = 0
  let g:go_fmt_command = 'goimports'
  let g:go_fmt_fail_silently = 1

  " this breaks folding on vim < 8.0 or neovim
  if v:version >= 800 || has('nvim')
    let g:go_fmt_experimental = 1
  endif

  let g:go_highlight_build_constraints = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_generate_tags = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_types = 1
  " let g:go_highlight_function_calls = 1
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_go#listener()
  autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
  autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
  autocmd FileType go nmap gty :CocCommand go.tags.add yaml<cr>
  autocmd FileType go nmap gtx :CocCommand go.tags.clear<cr>
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_go#install(install)
  call a:install('fatih/vim-go', { 'do': ':GoUpdateBinaries' })
endfunction
