"=============================================================================
" FILE: autocmds.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

function! automemories#core#autocmds#get()
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => session
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  if exists('g:automemories#config.options.session.enable') &&
    \ g:automemories#config.options.session.enable
    augroup am_session
      autocmd!
      if get(g:automemories#config.options.session, 'autoload', 0)
        autocmd User AutomemoriesPlugLoaded nested call automemories#session#load_hash(getcwd())
      endif

      if get(g:automemories#config.options.session, 'autosave', 0)
        autocmd VimLeavePre * nested call automemories#session#save_hash(getcwd())
      endif
    augroup end
  endif

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => color
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  if exists('g:automemories#config.options.colorscheme')
    autocmd User AutomemoriesPlugLoaded nested execute 'colorscheme' g:automemories#config.options.colorscheme
  endif
endfunction
