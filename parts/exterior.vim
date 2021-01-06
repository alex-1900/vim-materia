"=============================================================================
" FILE: filetype.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" goyo
" Distraction-free writing in Vim.
" https://github.com/junegunn/goyo.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let goyo = {'id': 'goyo', 'directory': 'goyo.vim'}
function! goyo.installer(install)
  call a:install('junegunn/goyo.vim')
endfunction
call materia#part#add(goyo)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" limelight_vim
" Distraction-free writing in Vim.
" https://github.com/junegunn/limelight.vim
"
" Error: `Cannot calculate background color`:
" https://github.com/junegunn/limelight.vim/issues/39
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let limelight_vim = {'id': 'limelight_vim', 'directory': 'limelight.vim'}
function! limelight_vim.preloader()
  " Color name (:help cterm-colors) or ANSI code
  let g:limelight_conceal_ctermfg = materia#conf('parts.limelight_vim.conceal_ctermfg')
  " Color name (:help gui-colors) or RGB color
  let g:limelight_conceal_guifg = materia#conf('parts.limelight_vim.conceal_guifg')
  " Default: 0.5
  let g:limelight_default_coefficient = materia#conf('parts.limelight_vim.default_coefficient')
  " Number of preceding/following paragraphs to include (default: 0)
  let g:limelight_paragraph_span = materia#conf('parts.limelight_vim.paragraph_span')
  " Highlighting priority (default: 10)
  "   Set it to -1 not to overrule hlsearch
  let g:limelight_priority = materia#conf('parts.limelight_vim.priority')
endfunction

function! limelight_vim.loader()
  let key_prefix = GetConfigMapPrefix(materia#conf('parts.limelight_vim.basekey'))
  execute 'nnoremap <silent> '. key_prefix.reader .'l :<C-u>Limelight!!<CR>'
  for n in range(0, 9)
    execute 'nnoremap <silent> '. key_prefix.reader . n .' :<C-u>Limelight 0.'. n .'<CR>'
  endfor
endfunction

function! limelight_vim.installer(install)
  call a:install('junegunn/limelight.vim')
endfunction
call materia#part#add(limelight_vim)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_airline
" Lean & mean status/tabline for vim that's light as air.
" https://github.com/vim-airline/vim-airline
" https://github.com/vim-airline/vim-airline-themes
" https://github.com/vim-airline/vim-airline/wiki/FAQ
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vim_airline = {'id': 'vim_airline', 'directory': 'vim-airline'}
function ModuleAirLineMateriaAddition(...)
  let builder = a:1
  let system_serv = materia#service#get('system')
  highlight UserStatusLine guifg=#EEEEEE ctermfg=7 guibg=#4169E1 ctermbg=24 gui=NONE cterm=NONE
  call builder.add_section_spaced('UserStatusLine', system_serv.username)
  return 0
endfunction

function! MyLineNumber()
  let system_serv = materia#service#get('system')
  return system_serv.username
endfunction

function! vim_airline.preloader()
  " Automatically displays all buffers when there's only one tab open.
  let g:airline#extensions#tabline#enabled = materia#conf('parts.vim_airline.with_tabline')
  let g:airline#extensions#tabline#formatter = materia#conf('parts.vim_airline.tabline_formatter')
  let g:airline#extensions#whitespace#enabled=0
  let g:airline_powerline_fonts=1
  let g:airline_left_sep = "\ue0b0"
  let g:airline_left_alt_sep = "\ue0b1"
  " \ue0ba \ue0bb
  let g:airline_right_sep = "\ue0b2"
  let g:airline_right_alt_sep = "\ue0b3"
  if materia#conf('parts.vim_airline.with_hunks')
    let g:airline#extensions#hunks#enabled = 1
    let g:airline#extensions#hunks#coc_git = 1
  endif
  if materia#conf('parts.vim_airline.with_branch')
    let g:airline#extensions#branch#enabled = 1
  endif
  let g:airline_skip_empty_sections = 1
  let g:bufferline_echo = 0
  if !exists('g:airline_symbols')
    let g:airline_symbols={}
  endif

  " theme
  let theme = materia#conf('parts.vim_airline.theme')
  if type(theme) == type('')
    let g:airline_theme = theme
  endif
endfunction

function! vim_airline.installer(install)
  call a:install('vim-airline/vim-airline')
  call a:install('vim-airline/vim-airline-themes')
endfunction

call materia#part#add(vim_airline)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline_weather
" Vim-airline extension to show weather in the status line.
" https://github.com/Wildog/airline-weather.vim
" https://github.com/mattn/webapi-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let airline_weather = {'id': 'airline_weather', 'directory': 'vim-devicons'}
function! airline_weather.preloader()
  let temp_dir = materia#homepath('/temp/airline_weather')
  if !isdirectory(temp_dir)
    call mkdir(temp_dir, 'p')
  endif
  let g:weather#cache_file = temp_dir . '/cache_file'
  let g:weather#area = materia#conf('parts.airline_weather.attr_area')
  let g:weather#cache_ttl = materia#conf('parts.airline_weather.attr_cache_ttl')
endfunction
function! airline_weather.installer(install)
  call a:install('Wildog/airline-weather.vim')
  call a:install('mattn/webapi-vim')
endfunction
call materia#part#add(airline_weather)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_devicons
" Adds filetype glyphs (icons) to various vim plugins.
" https://github.com/ryanoasis/vim-devicons
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vim_devicons = {'id': 'vim_devicons', 'directory': 'vim-devicons'}
function! vim_devicons.preloader()
  let app_system = materia#service#get('system')
  let g:webdevicons_enable = 1
  if !app_system.is_gui
    let g:webdevicons_enable = 0
  endif
endfunction
function! vim_devicons.installer(install)
  call a:install('ryanoasis/vim-devicons')
endfunction
call materia#part#add(vim_devicons)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_startify
" https://github.com/mhinz/vim-startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vim_startify = {'id': 'vim_startify', 'directory': 'vim-startify'}
function! vim_startify.preloader()
  let g:startify_change_to_vcs_root = 1
  let g:startify_session_dir = materia#homepath('/sessions/custom')

  let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   Files']            },
    \ { 'type': 'dir',       'header': ['   Dirs '. getcwd()] },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ { 'type': 'commands',  'header': ['   Commands']       },
  \ ]

  let g:startify_custom_header_quotes = materia#conf('parts.vim_startify.header_quotes')
endfunction

function! vim_startify.loader()
  " autocmd BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) | Startify | endif
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

function! vim_startify.installer(install)
  call a:install('mhinz/vim-startify')
endfunction
call materia#part#add(vim_startify)
