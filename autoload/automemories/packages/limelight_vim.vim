"=============================================================================
" FILE: view.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#limelight_vim#options()

endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#limelight_vim#config()
  " limelight.vim
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => listener
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#limelight_vim#listener()
  " limelight.vim
  nnoremap <leader>ll :Limelight!! 1<CR>
  for n in range(0, 9)
    execute 'nnoremap <leader>l'. n ':Limelight 0.' . n .'<CR>'
  endfor
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => install
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! automemories#packages#limelight_vim#install(install)
  call a:install('junegunn/limelight.vim')
endfunction
