"=============================================================================
" FILE: vim-airline.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" Lean & mean status/tabline for vim that's light as air.
" https://github.com/vim-airline/vim-airline
" https://github.com/vim-airline/vim-airline-themes
"=============================================================================

" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#whitespace#enabled=0
let g:airline_powerline_fonts=1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#coc_git = 1
let g:airline#extensions#branch#enabled=1
if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif

function PluggedAirLineAutoMemoriesAddition(...)
  highlight UserStatusLine guifg=#EEEEEE ctermfg=7 guibg=#4169E1 ctermbg=24 gui=NONE cterm=NONE
  let s:username = automemories#util#get_username()
  call a:1.add_section_spaced('UserStatusLine', s:username)
endfunction

function ListenerPlugLoadedAirline(info = {})
  call airline#add_statusline_func('PluggedAirLineAutoMemoriesAddition')
endfunction

function ListenerPlugLoadedAirLineThemes(info = {})
  let g:airline_theme='deus'
  call airline#switch_theme('deus')
endfunction

Plug 'vim-airline/vim-airline', { 'do': function('ListenerPlugLoadedAirline') }
\| Plug 'vim-airline/vim-airline-themes', { 'do': function('ListenerPlugLoadedAirLineThemes') }
