"=============================================================================
" FILE: 01-gui-settings.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => basic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set <leader>
let mapleader = ";"
set nocompatible
set encoding=utf-8
set termencoding=utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => features
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ruler
set number
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
" => colors and fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable syntax highlighting
syntax on
syntax enable
" default theme
set background=dark
" default colorscheme
colorscheme janah
" the maximum number of colors
if &term == "screen"
  set t_Co=256
endif
set guifont=DroidSansMono_Nerd_Font:h14
if automemories#util#platform() == g:automemories#platform#win
  set guifont=DroidSansMono_Nerd_Font:h10
endif

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
set shortmess=a

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
