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
let s:gruvbox= {'name': 'gruvbox', 'tag': 'theme', 'title': 'Gruvbox'}
function! s:gruvbox.condition()
  return materia#conf('options.colorscheme') == 'gruvbox'
endfunction

function! s:gruvbox.preloader()
  " medium/soft/hard
  let g:gruvbox_contrast_dark = 'medium'
endfunction
function! s:gruvbox.loader()
  colorscheme gruvbox
  if exists('*airline#switch_theme')
    call airline#switch_theme('gruvbox')
  endif
endfunction

function! s:gruvbox.installer(install)
  call a:install('morhetz/gruvbox')
endfunction

call materia#packages#add('gruvbox', s:gruvbox)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" onedark
" https://github.com/joshdick/onedark.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:onedark= {'name': 'onedark.vim', 'tag': 'theme', 'title': 'Onedark'}

function! s:onedark.condition()
  return materia#conf('options.colorscheme') == 'onedark'
endfunction

function! s:onedark.preloader()
  let g:onedark_termcolors=256
  let g:lightline = {'colorscheme': 'onedark'}
endfunction

function! s:onedark.loader()
  colorscheme onedark
  if exists('*airline#switch_theme')
    call airline#switch_theme('onedark')
  endif
endfunction

function! s:onedark.installer(install)
  call a:install('joshdick/onedark.vim')
endfunction
call materia#packages#add('onedark', s:onedark)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" papercolor
" https://github.com/NLKNguyen/papercolor-theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:papercolor= {'name': 'papercolor-theme', 'tag': 'theme', 'title': 'PaperColor'}

function! s:papercolor.condition()
  return materia#conf('options.colorscheme') == 'papercolor'
endfunction

function! s:papercolor.preloader()
  let g:PaperColor_Theme_Options = materia#conf('packages.papercolor.attr_theme_options')
  let g:lightline = { 'colorscheme': 'PaperColor' }
endfunction

function! s:papercolor.loader()
  colorscheme PaperColor
  if exists('*airline#switch_theme')
    call airline#switch_theme('papercolor')
  endif
endfunction

function! s:papercolor.installer(install)
  call a:install('NLKNguyen/papercolor-theme')
endfunction

call materia#packages#add('papercolor', s:papercolor)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" iceberg
" https://github.com/cocopon/iceberg.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:iceberg= {'name': 'iceberg.vim', 'tag': 'theme', 'title': 'Iceberg'}

function! s:iceberg.condition()
  return materia#conf('options.colorscheme') == 'iceberg'
endfunction

function! s:iceberg.loader()
  colorscheme iceberg
  if exists('*airline#switch_theme')
    call airline#switch_theme('iceberg')
  endif
endfunction

function! s:iceberg.installer(install)
  call a:install('cocopon/iceberg.vim')
endfunction

call materia#packages#add('iceberg', s:iceberg)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" material_theme
" https://github.com/jdkanani/vim-material-theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:material_theme= {'name': 'vim-material-theme', 'tag': 'theme', 'title': 'Material'}

function! s:material_theme.condition()
  return materia#conf('options.colorscheme') == 'material-theme'
endfunction

function! s:material_theme.loader()
  syntax enable
  colorscheme material-theme
endfunction

function! s:material_theme.installer(install)
  call a:install('jdkanani/vim-material-theme')
endfunction

call materia#packages#add('material_theme', s:material_theme)
