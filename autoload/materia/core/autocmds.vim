"=============================================================================
" FILE: autocmds.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

function! materia#core#autocmds#get()
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => session
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  if exists('g:materia#config.options.session.enable') &&
    \ g:materia#config.options.session.enable
    augroup am_session
      autocmd!
      if get(g:materia#config.options.session, 'autoload', 0)
        autocmd User MateriaPlugLoaded nested call materia#session#load_hash(getcwd())
      endif

      if get(g:materia#config.options.session, 'autosave', 0)
        autocmd VimLeavePre * nested call materia#session#save_hash(getcwd())
      endif
    augroup end
  endif

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => color
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  if exists('g:materia#config.options.colorscheme')
    autocmd User MateriaPlugLoaded nested execute 'colorscheme' g:materia#config.options.colorscheme
  endif
endfunction
