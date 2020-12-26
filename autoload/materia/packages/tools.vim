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
  let g:NERDTreeShowBookmarks = materia#conf('packages.nerdtree.bookmarks')
  " let g:NERDTreeWinPos="dark"
  let g:NERDTreeShowLineNumbers = materia#conf('packages.nerdtree.show_line_numbers')
  let g:NERDTreeAutoCenter=0
  let g:NERDTreeHighlightCursorline = 1
  let g:NERDTreeShowFiles = 1
  " avoid crashes when calling vim-plug functions while the cursor is on the NERDTree window
  let g:plug_window = 'noautocmd vertical topleft new'
  " hide the boring brackets([ ])
  let g:NERDTreeGitStatusConcealBrackets = 1

  let g:NERDTreeDirArrowExpandable = '▷'
  let g:NERDTreeDirArrowCollapsible = '▽'
endfunction
function! s:nerdtree.listener()
  let key_prefix = GetConfigMapPrefix(materia#conf('packages.nerdtree.basekey'))
  let key_toggle = materia#conf('packages.nerdtree.key_toggle')
  let key_focus = materia#conf('packages.nerdtree.key_focus')
  execute 'nnoremap <silent> '. key_prefix.edge .'o :<C-u>NERDTreeToggle<CR>'
  execute 'nnoremap <silent> '. key_prefix.edge .'f :<C-u>NERDTreeFocus<CR>'
endfunction
function! s:nerdtree.install(install)
  call a:install('preservim/nerdtree')
  if materia#conf('packages.nerdtree.visual_selection')
    call a:install('PhilRunninger/nerdtree-visual-selection')
  endif
  if materia#conf('packages.nerdtree.buffer_ops')
    call a:install('PhilRunninger/nerdtree-buffer-ops')
  endif
  \| call a:install('Xuyuanp/nerdtree-git-plugin')
endfunction
call materia#packages#add_package('nerdtree', s:nerdtree)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => undotree
" The plug-in visualizes undo history and makes it easier to browse and switch between different undo branches
" https://github.com/mbbill/undotree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:undotree = {}
function! s:undotree.listener()
  let key_prefix = GetConfigMapPrefix(materia#conf('packages.nerdtree.basekey'))
  execute 'nnoremap <silent> '. key_prefix.edge .'u :<C-u>UndotreeToggle<CR>'
endfunction
function! s:undotree.install(install)
  call a:install('mbbill/undotree')
endfunction
call materia#packages#add_package('undotree', s:undotree)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_tmux_navigator
" Seamless navigation between tmux panes and vim splits
" https://github.com/christoomey/vim-tmux-navigator
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_tmux_navigator = {}
function! s:vim_tmux_navigator.install(install)
  call a:install('christoomey/vim-tmux-navigator')
endfunction
call materia#packages#add_package('vim_tmux_navigator', s:vim_tmux_navigator)

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
call materia#packages#add_package('vista_vim', s:vista_vim)

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
call materia#packages#add_package('vim_fugitive', s:vim_fugitive)

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
call materia#packages#add_package('vim_gitgutter', s:vim_gitgutter)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_gitgutter
" A Vim plugin which shows a git diff in the sign column.
" https://github.com/airblade/vim-gitgutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:materia_session = {}
function! s:materia_session.config()
  let g:materia_session_mode = 'dir'
  let g:materia_session_directory = materia#homepath('/temp/sessions')
  let g:session_autosave_on_actions = 1
endfunction

function! s:materia_session.listener()
  if g:loaded_materia_session
    call MateriaSessionLoad()
    autocmd VimLeavePre * :MateriaSessionSave<CR>
  endif
endfunction

function! s:materia_session.install(install)
  call a:install('speed-sonic/vim-materia-session')
endfunction

call materia#packages#add_package('materia_session', s:materia_session)
