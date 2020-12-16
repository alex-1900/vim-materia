"=============================================================================
" FILE: 01-gui-settings.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

if automemories#platform#gui()
" begin of gui settings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => features
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle menu bar and tabbar
map <silent> <F6> :if &guioptions =~# 'T' <Bar>
    \set guioptions-=T <Bar>
    \set guioptions-=m <bar>
  \else <Bar>
    \set guioptions+=T <Bar>
    \set guioptions+=m <Bar>
  \endif<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlight all occurrences of the visually selected text
function! MakePattern(text)
  let pat = escape(a:text, '\')
  let pat = substitute(pat, '\_s\+$', '\\s\\*', '')
  let pat = substitute(pat, '^\_s\+', '\\s\\*', '')
  let pat = substitute(pat, '\_s\+',  '\\_s\\+', 'g')
  return '\\V' . escape(pat, '\"')
endfunction
vnoremap <leader>ah :<C-U>let @/="<C-R>=MakePattern(@*)<CR>"<CR>:set hlsearch<CR>

" end of gui settings
endif
