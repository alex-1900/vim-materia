"=============================================================================
" FILE: coc_go.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" https://github.com/josa42/coc-go
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#coc_go#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#coc_go#config()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#coc_go#listener()
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#coc_go#install(install)
  call a:install('josa42/coc-go', { 'do': 'yarn install --frozen-lockfile' })
endfunction
