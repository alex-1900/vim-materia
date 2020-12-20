"=============================================================================
" FILE: airline.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" Lean & mean status/tabline for vim that's light as air.
" https://github.com/vim-airline/vim-airline
" https://github.com/vim-airline/vim-airline-themes
" https://github.com/vim-airline/vim-airline/wiki/FAQ
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_airline#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_airline#config()
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
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_airline#listener()
  call airline#add_statusline_func('ModuleAirLineAutoMemoriesAddition')
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_airline#install(install)
  call a:install('vim-airline/vim-airline')
endfunction


function ModuleAirLineAutoMemoriesAddition(...)
  let system_serv = automemories#dependence#get('app#system')
  highlight UserStatusLine guifg=#EEEEEE ctermfg=7 guibg=#4169E1 ctermbg=24 gui=NONE cterm=NONE
  call a:1.add_section_spaced('UserStatusLine', system_serv.username)
  let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
endfunction
