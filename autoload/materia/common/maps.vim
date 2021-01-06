"=============================================================================
" FILE: maps.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

let s:app_system = materia#service#get('system')

function! materia#common#maps#get()

  inoremap vv <ESC>

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Move
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " Switch windows {
      " switch between different windows by their direction`
      map <C-J> <C-W>j<C-W>_
      map <C-K> <C-W>k<C-W>_
      map <C-L> <C-W>l<C-W>_
      map <C-H> <C-W>h<C-W>_
  " }

  " Bracket navigate maps {
      " using `[` and `]` to navigate
      let nkey = materia#conf('key.next')
      let pkey = materia#conf('key.prev')
      " buffers
      let modes = ['n']
      call Mapping(modes, 1, pkey .'b', ':<c-u>bprevious!<cr>')
      call Mapping(modes, 1, nkey .'b', ':<c-u>bnext!<cr>')
      call Mapping(modes, 1, pkey .'B', ':<c-u>bfirst!<cr>')
      call Mapping(modes, 1, nkey .'B', ':<c-u>blast!<cr>')
      " file list
      call Mapping(modes, 1, pkey .'f', ':<c-u>previous!<cr>')
      call Mapping(modes, 1, nkey .'f', ':<c-u>next!<cr>')
      call Mapping(modes, 1, pkey .'F', ':<c-u>first!<cr>')
      call Mapping(modes, 1, nkey .'F', ':<c-u>last!<cr>')
      " location list
      call Mapping(modes, 1, pkey .'l', ':<c-u>lprevious!<cr>')
      call Mapping(modes, 1, nkey .'l', ':<c-u>lnext!<cr>')
      call Mapping(modes, 1, pkey .'L', ':<c-u>lfirst!<cr>')
      call Mapping(modes, 1, nkey .'L', ':<c-u>llast!<cr>')
      call Mapping(modes, 1, pkey .'<C-L>', ':<c-u>lpfile!<cr>')
      call Mapping(modes, 1, nkey .'<C-L>', ':<c-u>lnfile!<cr>')
      " quickfix list
      call Mapping(modes, 1, pkey .'q', ':<c-u>cprevious!<cr>')
      call Mapping(modes, 1, nkey .'q', ':<c-u>cnext!<cr>')
      call Mapping(modes, 1, pkey .'Q', ':<c-u>cfirst!<cr>')
      call Mapping(modes, 1, nkey .'Q', ':<c-u>clast!<cr>')
      call Mapping(modes, 1, pkey .'<C-Q>', ':<c-u>cpfile!<cr>')
      call Mapping(modes, 1, nkey .'<C-Q>', ':<c-u>cnfile!<cr>')
      " UI theme
      call Mapping(modes, 1, nkey .'u', ':<c-u>NextTheme<cr>')
      call Mapping(modes, 1, pkey .'u', ':<c-u>PrevTheme<cr>')
      " git conflict (try `d[n` to remove a conflict)
      call Mapping(['n', 'o'], 1, pkey .'c', '<C-U>call s:search_conflict(1)<cr>')
      call Mapping(['n', 'o'], 1, nkey .'c', '<C-U>call s:search_conflict(0)<cr>')
      call Mapping(['x'], 1, pkey .'c', "<C-U>exe 'normal! gv'<Bar>call s:search_conflict(1)<cr>")
      call Mapping(['x'], 1, nkey .'c', "<C-U>exe 'normal! gv'<Bar>call s:search_conflict(0)<cr>")

      function! s:search_conflict(reverse) abort
        call search('^\(@@ .* @@\|[<=>|]\{7}[<=>|]\@!\)', a:reverse ? 'bW' : 'W')
      endfunction

  " }

  " Basic moving {
      noremap j gj
      noremap k gk
      " Easier horizontal scrolling
      map zl zL
      map zh zH
      " Visual shifting (does not exit Visual mode)
      vnoremap < <gv
      vnoremap > >gv
  " }

  " close the current buffer
  nnoremap <C-x>b :bdelete<CR>

  " Move mutiple lines
  let l:multiple = materia#conf('options.scroll_multiple')
  execute 'nnoremap <nowait> <C-e> '. l:multiple .'<C-e>'
  execute 'nnoremap <nowait> <C-y> '. l:multiple .'<C-y>'

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " motions
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " ie = inner entire buffer
    onoremap ie :exec "normal! ggVG"<cr>

    " iv = current viewable text in the buffer
    onoremap iv :exec "normal! HVL"<cr>

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " git
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " save current buffer
  " inoremap <M-w> <ESC>:w<CR>:startinsert<CR>

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " terminal
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-x>t :bd!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  if s:app_system.is_gui
    " begin of gui settings

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " features
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
