"=============================================================================
" FILE: settings.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

function! automemories#core#options#get()

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => basic
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " set <leader>
  let g:mapleader = '\'
  if exists('g:automemories#config.default.key_leader')
    let g:mapleader = g:automemories#config.default.key_leader
  endif
  set nocompatible
  set encoding=utf-8
  set termencoding=utf-8

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => features
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  set ruler
  set number
  set relativenumber
  set numberwidth=5
  " always show statusline
  set laststatus=2
  " don't redraw while executing macros
  set lazyredraw
  " for regular expressions turn magic on
  set magic
  " show matching brackets when text indicator is over them
  set showmatch
  " how many tenths of a second to blink when matching brackets
  set mat=2
  " display long lines as just one line
  set nowrap
  " enable list
  set list
  " set chars for list
  set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
  " always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  if has("patch-8.1.1564")
    " recently vim can merge signcolumn and number column into one
    set signcolumn=number
  else
    set signcolumn=yes
  endif

  set bsdir=buffer
  set cscopequickfix=s-,c-,d-,i-,t-,e-
  set updatetime=100

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => sessions
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " If you don't want help windows to be restored:
  set sessionoptions-=help
  " Don't persist options and mappings because it can corrupt sessions.
  set sessionoptions-=options
  set sessionoptions-=blank
  set sessionoptions+=tabpages

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => colors and fonts
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " enable syntax highlighting
  if &t_Co > 1
    syntax enable
  endif
  " default theme
  set background=dark
  " default colorscheme
  colorscheme janah
  " the maximum number of colors
  if &term == "screen"
    set t_Co=256
  endif

  if has('nvim')
    set guifont=DroidSansMono\ Nerd\ Font:h14
    if automemories#util#is_windows()
      set guifont=DroidSansMono\ Nerd\ Font:h10
    endif
  else
    set guifont=DroidSansMono_Nerd_Font:h14
    if automemories#util#is_windows()
      set guifont=DroidSansMono_Nerd_Font:h10
    endif
  endif
  " highlight the current line
  set cursorline!

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => search
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  set hlsearch
  " show the next match while entering a search
  set incsearch
  " searching wrap around
  set wrapscan

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => files
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " no need to backup
  set nobackup
  set nowritebackup
  set noswapfile
  set noundofile 
  " fileformat options
  set ffs=unix,dos,mac
  " files encoding
  set fileencodings=ucs-bom,utf-8,chinese,cp936
  " load ftplugin and indent
  filetype plugin indent on
  " set to auto read when a file is changed from the outside
  set autoread

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => command line
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  set cmdheight=1
  set shortmess=at

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => edit
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " to allow backspacing over everything in insert mode
  set backspace=indent,eol,start
  " ignore case when searching
  set ignorecase
  " when searching try to be smart about cases
  set smartcase
  " insert space characters whenever the tab key is pressed
  set expandtab
  " insert 4 spaces for a tab
  set tabstop=4
  set softtabstop=4
  " change the number of space characters inserted for indentation
  set shiftwidth=4
  " automatically indent the next new line to match the indent of the previous one
  set autoindent
  " reacts to the syntax/style of the code you are editing
  set smartindent
  " sets how many lines of history VIM has to remember
  set history=500
  " some plugin will use it
  set modifiable

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " => mouse
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  set mousemodel=extend

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  if automemories#util#is_gui()
    " begin of gui settings

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => basic
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " visually selecting text automatically places the text in the clipboard (register *) 
    set guioptions+=a

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => features
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " close error bells
    set noerrorbells
    set novisualbell
    set vb t_vb=
    au GUIEnter * set t_vb=
    " remove menu bar
    set guioptions-=m
    " remove toolbar
    set guioptions-=T

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => colors and fonts
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " no toolbar
    set lines=45
    set columns=160
    " set linespace=0

    " end of gui settings
  endif


endfunction
