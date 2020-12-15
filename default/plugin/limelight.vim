"=============================================================================
" FILE: limelight.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" Hyperfocus-writing in Vim.
" https://github.com/junegunn/limelight.vim
"=============================================================================

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ListenerPlugLoadedLimelight()
  if HasPlug('limelight.vim')
    nnoremap <leader>ll :Limelight!! 1<CR>
    for n in range(0, 9)
      execute 'nnoremap <leader>l'. n ':Limelight 0.' . n .'<CR>'
    endfor
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => trigger
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PlugOptionDoLimelight(info = {})
  call ListenerPlugLoadedLimelight()
endfunction

Plug 'junegunn/limelight.vim', { 'do': function('PlugOptionDoLimelight') }
