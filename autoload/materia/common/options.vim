"=============================================================================
" FILE: settings.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

let s:app_system = materia#service#get('system')

function! materia#common#options#get()

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " basic
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " set <leader>
  let g:mapleader = materia#config#get('key.leader')
  let g:maplocalleader = materia#config#get('key.localleader')
  set nocompatible
  set encoding=utf-8
  set termencoding=utf-8

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " features
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  if has('cmdline_info')
    set ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    set showcmd
  endif
  set number
  set relativenumber
  " Display the current mode
  set showmode
  set numberwidth=4
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
  set conceallevel=0
  " No extra spaces between rows
  set linespace=0
  " Lines to scroll when cursor leaves screen
  set scrolljump=5
  " Minimum lines to keep above and below cursor
  set scrolloff=3
  " registor * -> clipboard
  if materia#config#get('options.clipboard_catch')
    set clipboard^=unnamed
  endif

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " statusline
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  if has('statusline')
    " always show statusline
    set laststatus=2
    " Broken down into easily includeable segments
    " Filename
    set statusline=%<%f\
    " Options
    set statusline+=%w%h%m%r
    if !exists('g:override_spf13_bundles')
      set statusline+=%{fugitive#statusline()} " Git Hotness
    endif
    set statusline+=\ [%{&ff}/%Y]            " Filetype
    set statusline+=\ [%{getcwd()}]          " Current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
  endif

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " sessions
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " If you don't want help windows to be restored:
  set sessionoptions-=help
  " Don't persist options and mappings because it can corrupt sessions.
  set sessionoptions-=options
  set sessionoptions-=blank
  set sessionoptions-=globals
  set sessionoptions-=tabpages
  set sessionoptions-=resize
  set sessionoptions-=winpos
  set sessionoptions-=winsize

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " colors and fonts
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " enable syntax highlighting
  if &t_Co > 1
    syntax enable
  endif
  " default theme
  execute 'set background='. materia#config#get('options.background')
  " default colorscheme
  " colorscheme material-theme
  " the maximum number of colors
  set t_Co=256

  if !s:app_system.is_gui || !has('nvim')
    execute 'set guifont='. materia#strategies#guifont()
  endif
  " true colors terminal option
  if !has("nvim")
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
  set termguicolors

  " highlight the current line
  set cursorline!
  highlight Comment cterm=italic
  " SignColumn should match background
  highlight clear SignColumn
  " Current line number row will have same background color in relative mode
  highlight clear LineNr

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " search
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  set hlsearch
  " show the next match while entering a search
  set incsearch
  " searching wrap around
  set wrapscan

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " files
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " no need to backup
  set nobackup
  set nowritebackup
  set noswapfile
  if materia#config#get('options.undo_persistent')
    " persistent undo
    let s:undodir = materia#homepath("/temp/undodir")
    execute 'set undodir=' . s:undodir
    set undofile
  else
    set noundofile
  endif

  " fileformat options
  set ffs=unix,dos,mac
  " files encoding
  set fileencodings=ucs-bom,utf-8,chinese,cp936
  " load ftplugin and indent
  filetype plugin indent on
  " set to auto read when a file is changed from the outside
  set autoread

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " command line
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  set cmdheight=1
  set shortmess=at

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " edit
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
  " Prevents inserting two spaces after punctuation on a join (J)
  set nojoinspaces

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " mouse
  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  set mousemodel=extend

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  if s:app_system.is_gui
    " begin of gui settings

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " basic
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " visually selecting text automatically places the text in the clipboard (register *) 
    set guioptions+=a

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " features
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
    " colors and fonts
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " no toolbar
    set lines=45
    set columns=160

    " end of gui settings
  endif


endfunction
