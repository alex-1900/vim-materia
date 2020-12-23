"=============================================================================
" FILE: tools.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nerdtree
" The NERDTree is a file system explorer for the Vim editor.
" https://github.com/preservim/nerdtree
" https://github.com/PhilRunninger/nerdtree-visual-selection
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:nerdtree = {}
function! s:nerdtree.config()
  let g:NERDTreeAutoCenter=1
  let g:NERDTreeShowBookmarks=1
  " let g:NERDTreeWinPos="dark"
  let g:NERDTreeShowLineNumbers=1
  let g:NERDTreeAutoCenter=1
  let g:NERDTreeHighlightCursorline = 1
  let g:NERDTreeShowFiles = 1
  " avoid crashes when calling vim-plug functions while the cursor is on the NERDTree window
  let g:plug_window = 'noautocmd vertical topleft new'

  let g:NERDTreeDirArrowExpandable = '▸'
  let g:NERDTreeDirArrowCollapsible = '▾'
endfunction
function! s:nerdtree.listener()
  nnoremap <silent> <leader>b :NERDTreeToggle<CR>
  " nnoremap <silent> <leader>bf <C-u>:NERDTreeFind<CR>
  " nnoremap <silent> <leader>bn <C-u>:NERDTreeFocus<CR>
endfunction
function! s:nerdtree.install(install)
  call a:install('preservim/nerdtree')
  call a:install('PhilRunninger/nerdtree-visual-selection')
endfunction
call materia#modules#add_package('nerdtree', s:nerdtree)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => undotree
" The plug-in visualizes undo history and makes it easier to browse and switch between different undo branches
" https://github.com/mbbill/undotree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:undotree = {}
function! s:undotree.listener()
  nnoremap <leader>u :UndotreeToggle<CR>
endfunction
function! s:undotree.install(install)
  call a:install('mbbill/undotree')
endfunction
call materia#modules#add_package('undotree', s:undotree)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_tmux_navigator
" Seamless navigation between tmux panes and vim splits
" https://github.com/christoomey/vim-tmux-navigator
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_tmux_navigator = {}
function! s:vim_tmux_navigator.install(install)
  call a:install('christoomey/vim-tmux-navigator')
endfunction
call materia#modules#add_package('vim_tmux_navigator', s:vim_tmux_navigator)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vista_vim
" View and search LSP symbols, tags in Vim/NeoVim.
" https://github.com/liuchengxu/vista.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vista_vim = {}
function! s:vista_vim.config()
  let g:vista_sidebar_width = 35
  let g:vista#renderer#enable_icon = 1
  let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
  let g:vista#executives = ['coc']
  let g:vista_executive_for = {
  \ 'php': 'coc', 'html': 'coc', 'css': 'coc'
  \ }
endfunction
function! s:vista_vim.listener()
  nnoremap <silent> <leader>vv :Vista!!<CR>
  nnoremap <silent> <leader>vf :Vista finder<CR>
endfunction
function! s:vista_vim.install(install)
  call a:install('liuchengxu/vista.vim')
endfunction
call materia#modules#add_package('vista_vim', s:vista_vim)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_fugitive
" Fugitive is the premier Vim plugin for Git. Or maybe it's the premier Git plugin for Vim?
" https://github.com/tpope/vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_fugitive = {}
function! s:vim_fugitive.listener()
  nnoremap <leader>gg :Git --paginate<CR>
  nnoremap <leader>gd :Git diff<CR>
  nnoremap <leader>gl :Git log<CR>
  nnoremap <leader>grl :Git reflog<CR>
endfunction
function! s:vim_fugitive.install(install)
  call a:install('tpope/vim-fugitive')
endfunction
call materia#modules#add_package('vim_fugitive', s:vim_fugitive)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_gitgutter
" A Vim plugin which shows a git diff in the sign column.
" https://github.com/airblade/vim-gitgutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_gitgutter = {}
function! s:vim_gitgutter.config()
  let g:gitgutter_max_signs = -1
endfunction
function! s:vim_gitgutter.listener()
  highlight! link SignColumn LineNr 
  " nmap ]h <Plug>(GitGutterNextHunk)
  " nmap [h <Plug>(GitGutterPrevHunk)
endfunction
function! s:vim_gitgutter.install(install)
  call a:install('airblade/vim-gitgutter')
endfunction
call materia#modules#add_package('vim_gitgutter', s:vim_gitgutter)
