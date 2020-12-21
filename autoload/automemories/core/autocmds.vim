"=============================================================================
" FILE: autocmds.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

function! automemories#core#autocmds#get()
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => vim enter
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " " call automemories#session#load_hash(getcwd())
  " augroup am_vim_enter
  "   autocmd!
  "   autocmd VimEnter * nested call ListenerSessionLoad()
  " augroup end

  " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " " => vim leave pre
  " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " augroup am_vim_leave_pre
  "   autocmd!
  "   autocmd VimLeavePre * nested call ListenerSessionSave()
  " augroup end

   if exists('g:automemories#config.default.colorscheme')
    autocmd User AutomemoriesPlugLoaded nested execute 'colorscheme' g:automemories#config.default.colorscheme
  endif
endfunction
