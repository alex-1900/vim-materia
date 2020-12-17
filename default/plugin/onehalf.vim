"=============================================================================
" FILE: auto-pairs.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" NeoVim + Tmux with true colors on iTerm2.
" https://github.com/sonph/onehalf/tree/master/vim
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function ListenerPlugLoadedOnehalf()
  if HasPlug('onehalf') && HasPlug('vim-airline')
    colorscheme onehalfdark
    let g:airline_theme='onehalfdark'
    call airline#switch_theme('onehalfdark')
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => trigger
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PlugOptionDoOnehalf(info = {})
  call ListenerPlugLoadedOnehalf()
endfunction

Plug 'sonph/onehalf', { 'rtp': 'vim', 'do': function('PlugOptionDoOnehalf') }

call AutocmdAmPlugLoaded('ListenerPlugLoadedOnehalf')
