"=============================================================================
" FILE: filetype.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => goyo
" Distraction-free writing in Vim.
" https://github.com/junegunn/goyo.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:goyo = {}
function! s:goyo.listener()
  nnoremap gy :<C-u>Goyo<CR>
endfunction
function! s:goyo.install(install)
  call a:install('junegunn/goyo.vim')
endfunction
call materia#modules#add_package('goyo', s:goyo)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => limelight_vim
" Distraction-free writing in Vim.
" https://github.com/junegunn/limelight_vim.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:limelight_vim = {}
function! s:limelight_vim.config()
  " Color name (:help cterm-colors) or ANSI code
  let g:limelight_conceal_ctermfg = 'gray'
  let g:limelight_conceal_ctermfg = 240
  " Color name (:help gui-colors) or RGB color
  let g:limelight_conceal_guifg = 'DarkGray'
  let g:limelight_conceal_guifg = '#777777'
  " Default: 0.5
  let g:limelight_default_coefficient = 0.8
  " Number of preceding/following paragraphs to include (default: 0)
  let g:limelight_paragraph_span = 1
  " Highlighting priority (default: 10)
  "   Set it to -1 not to overrule hlsearch
  let g:limelight_priority = -1
endfunction

function! s:limelight_vim.listener()
  nnoremap <leader>ll :Limelight!! 1<CR>
  for n in range(0, 9)
    execute 'nnoremap <leader>l'. n ':Limelight 0.' . n .'<CR>'
  endfor
endfunction

function! s:limelight_vim.install(install)
  call a:install('junegunn/limelight.vim')
endfunction
call materia#modules#add_package('limelight_vim', s:limelight_vim)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_airline
" Lean & mean status/tabline for vim that's light as air.
" https://github.com/vim-airline/vim-airline
" https://github.com/vim-airline/vim-airline-themes
" https://github.com/vim-airline/vim-airline/wiki/FAQ
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_airline = {}
function ModuleAirLineMateriaAddition(...)
  let system_serv = materia#dependence#get('app#system')
  highlight UserStatusLine guifg=#EEEEEE ctermfg=7 guibg=#4169E1 ctermbg=24 gui=NONE cterm=NONE
  call a:1.add_section_spaced('UserStatusLine', system_serv.username)
  let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
endfunction

function! s:vim_airline.config()
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
function! s:vim_airline.listener()
  call airline#remove_statusline_func('ModuleAirLineMateriaAddition')
  call airline#add_statusline_func('ModuleAirLineMateriaAddition')
endfunction
function! s:vim_airline.install(install)
  call a:install('vim-airline/vim-airline')
endfunction
call materia#modules#add_package('vim_airline', s:vim_airline)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_airline_themes
" Lean & mean status/tabline for vim that's light as air.
" https://github.com/vim-airline/vim-airline-themes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_airline_themes = {}
function! s:vim_airline_themes.listener()
  call airline#switch_theme('deus')
endfunction
function! s:vim_airline_themes.install(install)
  call a:install('vim-airline/vim-airline-themes')
endfunction
call materia#modules#add_package('vim_airline_themes', s:vim_airline_themes)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_devicons
" Adds filetype glyphs (icons) to various vim plugins.
" https://github.com/ryanoasis/vim-devicons
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_devicons = {}
function! s:vim_devicons.config()
  let app_system = materia#dependence#get('app#system')
  let g:webdevicons_enable = 1
  if !app_system.is_gui
    let g:webdevicons_enable = 0
  endif
endfunction
function! s:vim_devicons.install(install)
  call a:install('ryanoasis/vim-devicons')
endfunction
call materia#modules#add_package('vim_devicons', s:vim_devicons)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_nerdtree_syntax_highlight
" This adds syntax for nerdtree on most common file extensions.
" https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_nerdtree_syntax_highlight = {}
function! s:vim_nerdtree_syntax_highlight.config()
  " Disable unmatched folder and file icons having the same color as their labels
  let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
  let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1
  " Disable uncommon file extensions highlighting (this is a good idea if you are experiencing lag when scrolling. Find more about lag on next session.)
  let g:NERDTreeLimitedSyntax = 1
endfunction
function! s:vim_nerdtree_syntax_highlight.install(install)
  call a:install('tiagofumo/vim-nerdtree-syntax-highlight')
endfunction
call materia#modules#add_package('vim_nerdtree_syntax_highlight', s:vim_nerdtree_syntax_highlight)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_startify
" https://github.com/mhinz/vim-startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_startify = {}
function! s:vim_startify.config()
  let g:startify_change_to_vcs_root = 1
  let g:startify_session_dir = materia#homepath('/sessions/custom')

  let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   Files']            },
    \ { 'type': 'dir',       'header': ['   Dirs '. getcwd()] },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ { 'type': 'commands',  'header': ['   Commands']       },
  \ ]

  let g:startify_custom_header_quotes = [
    \ ['The Materia vim configuration is on the way...']
  \ ]
endfunction

function! s:vim_startify.listener()
  autocmd BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) | Startify | endif
  if has('nvim')
    autocmd TabNewEntered * Startify
  else
    autocmd BufWinEnter *
      \ if !exists('t:startify_new_tab')
      \     && empty(expand('%'))
      \     && empty(&l:buftype)
      \     && &l:modifiable |
      \   let t:startify_new_tab = 1 |
      \   Startify |
      \ endif

    autocmd BufEnter *
      \ if !exists('t:startify_new_tab') && empty(expand('%')) && !exists('t:goyo_master') | 
      \   let t:startify_new_tab = 1 |
      \   Startify |
      \ endif
  endif
endfunction

function! s:vim_startify.install(install)
  call a:install('mhinz/vim-startify')
endfunction
call materia#modules#add_package('vim_startify', s:vim_startify)
