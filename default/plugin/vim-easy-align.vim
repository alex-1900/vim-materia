"=============================================================================
" FILE: vim-easy-align.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" A simple, easy-to-use Vim alignment plugin.
" https://github.com/junegunn/vim-easy-align
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ListenerPlugLoadedVimEasyAlign()
  if HasPlug('vim-easy-align')
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => trigger
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PlugOptionDoVimEasyAlign(...)
  call ListenerPlugLoadedVimEasyAlign()
endfunction

Plug 'junegunn/vim-easy-align', { 'do': function('PlugOptionDoVimEasyAlign') }

call AutocmdAmPlugLoaded('ListenerPlugLoadedVimEasyAlign')
