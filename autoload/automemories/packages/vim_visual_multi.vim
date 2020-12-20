"=============================================================================
" FILE: vim_visual_multi.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" It's called vim-visual-multi in analogy with visual-block, but the plugin works mostly from normal mode.
" https://github.com/mg979/vim-visual-multi
" https://github.com/mg979/vim-visual-multi/wiki
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_visual_multi#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_visual_multi#config()
  " vim-visual-multi
  let g:VM_leader = ';'
  let g:VM_maps = {}
  let g:VM_maps["Add Cursor Down"] = '<C-j>'
  let g:VM_maps["Add Cursor Up"] = '<C-k>'
  let g:VM_maps["Select l"] = '<C-l>'
  let g:VM_maps["Select h"] = '<C-h>'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_visual_multi#listener()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#vim_visual_multi#install(install)
  call a:install('mg979/vim-visual-multi')
endfunction
