"=============================================================================
" FILE: themes.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gruvbox
" https://github.com/morhetz/gruvbox
" https://github.com/morhetz/gruvbox/wiki/Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let gruvbox= {
  \ 'id': 'gruvbox',
  \ 'directory': 'gruvbox',
  \ 'tag': 'theme',
  \ 'title': 'Gruvbox'
\ }

function! gruvbox.preloader()
  " medium/soft/hard
  let g:gruvbox_contrast_dark = 'medium'
endfunction

function! gruvbox.loader()
  colorscheme gruvbox
  if exists('*airline#switch_theme')
    call airline#switch_theme('gruvbox')
  endif
endfunction

function! gruvbox.installer(install)
  call a:install('morhetz/gruvbox')
endfunction

call materia#part#add(gruvbox)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" onedark
" https://github.com/joshdick/onedark.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let onedark= {
  \ 'id': 'onedark',
  \ 'directory': 'onedark.vim',
  \ 'tag': 'theme',
  \ 'title': 'Onedark'
\ }

function! onedark.preloader()
  let g:onedark_termcolors=256
endfunction

function! onedark.loader()
  colorscheme onedark
  if exists('*airline#switch_theme')
    call airline#switch_theme('onedark')
  endif
endfunction

function! onedark.installer(install)
  call a:install('joshdick/onedark.vim')
endfunction
call materia#part#add(onedark)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" papercolor
" https://github.com/NLKNguyen/papercolor-theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let papercolor= {
  \ 'id': 'papercolor',
  \ 'directory': 'papercolor-theme',
  \ 'tag': 'theme',
  \ 'title': 'PaperColor'
\ }

function! papercolor.preloader()
  let g:PaperColor_Theme_Options = materia#conf('parts.papercolor.attr_theme_options')
  let g:lightline = { 'colorscheme': 'PaperColor' }
endfunction

function! papercolor.loader()
  colorscheme PaperColor
  if exists('*airline#switch_theme')
    call airline#switch_theme('papercolor')
  endif
  hi Defx_filename_root        guifg=#F5F5DC
  hi Defx_filename_directory   guifg=#F5F5DC
endfunction

function! papercolor.installer(install)
  call a:install('NLKNguyen/papercolor-theme')
endfunction

call materia#part#add(papercolor)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" material_theme
" https://github.com/jdkanani/vim-material-theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let material_theme= {
  \ 'id': 'material',
  \ 'directory': 'vim-material-theme',
  \ 'tag': 'theme',
  \ 'title': 'Material'
\ }

function! material_theme.loader()
  syntax enable
  colorscheme material-theme
  if exists('*airline#switch_theme')
    call airline#switch_theme('wombat')
  endif
  hi Defx_filename_root        guifg=#F5F5DC
  hi Defx_filename_directory   guifg=#F5F5DC
endfunction

function! material_theme.installer(install)
  call a:install('jdkanani/vim-material-theme')
endfunction

call materia#part#add(material_theme)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" iceberg
" https://github.com/cocopon/iceberg.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let iceberg= {
  \ 'id': 'iceberg',
  \ 'directory': 'iceberg.vim',
  \ 'tag': 'theme',
  \ 'title': 'Iceberg'
\ }

function! iceberg.loader()
  colorscheme iceberg
  if exists('*airline#switch_theme')
    call airline#switch_theme('iceberg')
  endif
  hi Defx_filename_root        guifg=#F5F5DC
  hi Defx_filename_directory   guifg=#F5F5DC
endfunction

function! iceberg.installer(install)
  call a:install('cocopon/iceberg.vim')
endfunction

call materia#part#add(iceberg)
