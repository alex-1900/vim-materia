"=============================================================================
" FILE: vim-airline.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" Lean & mean status/tabline for vim that's light as air.
" https://github.com/vim-airline/vim-airline
" https://github.com/vim-airline/vim-airline-themes
" https://github.com/vim-airline/vim-airline/wiki/FAQ
"=============================================================================

" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#whitespace#enabled=0
let g:airline_powerline_fonts=1
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#coc_git = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_skip_empty_sections = 1
let g:bufferline_echo = 0
if !exists('g:airline_symbols')
  let g:airline_symbols={}
endif

function PluggedAirLineAutoMemoriesAddition(...)
  highlight UserStatusLine guifg=#EEEEEE ctermfg=7 guibg=#4169E1 ctermbg=24 gui=NONE cterm=NONE
  let s:username = automemories#util#get_username()
  call a:1.add_section_spaced('UserStatusLine', s:username)
  let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function ListenerPlugLoadedAirline()
  if HasPlug('vim-airline')
    call airline#add_statusline_func('PluggedAirLineAutoMemoriesAddition')
  endif
endfunction

function ListenerPlugLoadedAirLineThemes()
  if HasPlug('vim-airline-themes') && HasPlug('vim-airline')
    let g:airline_theme='deus'
    call airline#switch_theme('deus')
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => trigger
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PlugOptionDoAirlineThemes(...)
  call ListenerPlugLoadedAirLineThemes()
endfunction

function! PlugOptionDoAirline(...)
  call ListenerPlugLoadedAirline()
endfunction

Plug 'vim-airline/vim-airline-themes', { 'do': function('PlugOptionDoAirlineThemes') }
Plug 'vim-airline/vim-airline', { 'do': function('PlugOptionDoAirline') }

call AutocmdAmPlugLoaded('ListenerPlugLoadedAirLineThemes')
call AutocmdAmPlugLoaded('ListenerPlugLoadedAirline')
