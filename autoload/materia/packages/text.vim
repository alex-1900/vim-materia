"=============================================================================
" FILE: text.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => auto_pairs
" Insert or delete brackets, parens, quotes in pair.
" https://github.com/jiangmiao/auto-pairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:auto_pairs = {}
function! s:auto_pairs.install(install)
  call a:install('jiangmiao/auto-pairs')
endfunction
call materia#packages#add_package('auto_pairs', s:auto_pairs)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerdcommenter
" Comment functions so powerful—no comment necessary.
" https://github.com/preservim/nerdcommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:nerdcommenter = {}
function! s:nerdcommenter.config()
  " Create default mappings
  let g:NERDCreateDefaultMappings = 1
  " Add spaces after comment delimiters by default
  let g:NERDSpaceDelims = 1
  " Use compact syntax for prettified multi-line comments
  let g:NERDCompactSexyComs = 1
  " Align line-wise comment delimiters flush left instead of following code indentation
  let g:NERDDefaultAlign = 'left'
  " Allow commenting and inverting empty lines (useful when commenting a region)
  let g:NERDCommentEmptyLines = 1
  " Enable trimming of trailing whitespace when uncommenting
  let g:NERDTrimTrailingWhitespace = 1
  " Enable NERDCommenterToggle to check all selected lines is commented or not 
  let g:NERDToggleCheckAllLines = 1
endfunction
function! s:nerdcommenter.install(install)
  call a:install('preservim/nerdcommenter')
endfunction
call materia#packages#add_package('nerdcommenter', s:nerdcommenter)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => supertab
" Perform all your vim insert mode completions with Tab
" https://github.com/ervandew/supertab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:supertab = {}
function! s:supertab.config()
  let g:SuperTabDefaultCompletionType = materia#conf('packages.supertab.scroll')
endfunction
function! s:supertab.install(install)
  call a:install('ervandew/supertab')
endfunction
call materia#packages#add_package('supertab', s:supertab)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_easy_align
" A simple, easy-to-use Vim alignment plugin.
" https://github.com/junegunn/vim-easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_easy_align = {}
function! s:vim_easy_align.listener()
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)
endfunction
function! s:vim_easy_align.install(install)
  call a:install('junegunn/vim-easy-align')
endfunction
call materia#packages#add_package('vim_easy_align', s:vim_easy_align)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_surround
" The plugin provides mappings to easily delete, change and add such surroundings in pairs.
" https://github.com/tpope/vim-surround
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_surround = {}
function! s:vim_surround.install(install)
  call a:install('tpope/vim-surround')
endfunction
call materia#packages#add_package('vim_surround', s:vim_surround)

" => vim_visual_multi
" It's called vim-visual-multi in analogy with visual-block, but the plugin works mostly from normal mode.
" https://github.com/mg979/vim-visual-multi
" https://github.com/mg979/vim-visual-multi/wiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_visual_multi = {}
function! s:vim_visual_multi.config()
  " vim-visual-multi
  let g:VM_leader = "'"
  " let g:VM_maps = {}
  " let g:VM_maps["Add Cursor Down"] = '<C-j>'
  " let g:VM_maps["Add Cursor Up"] = '<C-k>'
  " let g:VM_maps["Select l"] = '<C-l>'
  " let g:VM_maps["Select h"] = '<C-h>'
endfunction
function! s:vim_visual_multi.install(install)
  call a:install('mg979/vim-visual-multi')
endfunction
call materia#packages#add_package('vim_visual_multi', s:vim_visual_multi)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_better_whitespace
" This plugin causes all trailing whitespace characters to be highlighted. 
" https://github.com/ntpeters/vim-better-whitespace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_better_whitespace = {}
function! s:vim_better_whitespace.config()
  let g:better_whitespace_enabled = 1
  let g:strip_whitespace_on_save = materia#conf('packages.vim_better_whitespace.strip_on_save')
  let g:better_whitespace_ctermcolor = materia#conf('packages.vim_better_whitespace.ctermcolor')
  let g:better_whitespace_guicolor = materia#conf('packages.vim_better_whitespace.guicolor')
endfunction
function! s:vim_better_whitespace.install(install)
  call a:install('ntpeters/vim-better-whitespace')
endfunction
call materia#packages#add_package('vim_better_whitespace', s:vim_better_whitespace)
