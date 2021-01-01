"=============================================================================
" FILE: maps.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

let s:app_system = materia#dependence#get('app#system')

function! materia#core#maps#get()

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => features
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  inoremap vv <ESC>

  " Switch between different windows by their direction`
  map <C-J> <C-W>j<C-W>_
  map <C-K> <C-W>k<C-W>_
  map <C-L> <C-W>l<C-W>_
  map <C-H> <C-W>h<C-W>_

  " Find merge conflict markers
  map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

  noremap j gj
  noremap k gk
  " Easier horizontal scrolling
  map zl zL
  map zh zH

  " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv

  " goto or remove buffer
  nnoremap [b :bp!<CR>
  nnoremap ]b :bn!<CR>
  nnoremap <C-x>b :bd<CR>

  " mutiple lines
  let l:multiple = materia#conf('options.scroll_multiple')
  execute 'nnoremap <nowait> <C-e> '. l:multiple .'<C-e>'
  execute 'nnoremap <nowait> <C-y> '. l:multiple .'<C-y>'

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => files
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " save current buffer
  " inoremap <M-w> <ESC>:w<CR>:startinsert<CR>
  " nnoremap<M-w> :w<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  if s:app_system.is_gui
    " begin of gui settings

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => features
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " toggle menu bar and tabbar
    map <silent> <F6> :if &guioptions =~# 'T' <Bar>
        \ set guioptions-=T <Bar>
        \ set guioptions-=m <bar>
      \ else <Bar>
        \ set guioptions+=T <Bar>
        \ set guioptions+=m <Bar>
      \ endif<CR>

    " end of gui settings
  endif

endfunction
