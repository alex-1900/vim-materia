"=============================================================================
" FILE: docker_file.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" Vim syntax file & snippets for Docker's Dockerfile
" https://github.com/ekalinin/dockerfile.vim
"=============================================================================

let s:docker_file = {}
function! s:docker_file.install(install)
  call a:install('ekalinin/Dockerfile.vim')
endfunction
call materia#modules#add_package('docker_file', s:docker_file)

let s:materia_session = {}
function! s:materia_session.config()
  let g:meteria_session_mode = 'dir'
  let g:materia_session_directory = g:materia#path#home . '/test'
endfunction

function! s:materia_session.listener()
  MeteriaSessionLoad
  au VimLeavePre * :<C-u>MeteriaSessionSave<CR>
endfunction

function! s:materia_session.install(install)
  call a:install('F:\dev\github\speed-sonic\vim-materia-session')
endfunction

call materia#modules#add_package('materia_session', s:materia_session)
