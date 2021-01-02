"=============================================================================
" FILE: tools.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" defx
" The dark powered file explorer implementation
" https://github.com/Shougo/defx.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:defx = {'name': 'defx.nvim'}
function! s:defx.config()
  let g:defx_icons_enable_syntax_highlight = 1
  let g:defx_icons_column_length = 1

  " highlight groups for defx-icons
  hi DefxIconsDirectory        guifg=#FF0000
  hi DefxIconsParentDirectory  guifg=#FF0000
  hi DefxIconsSymlinkDirectory guifg=#FF0000
  hi DefxIconsOpenedTreeIcon   guifg=#FF0000
  hi DefxIconsNestedTreeIcon   guifg=#FF0000
  hi DefxIconsClosedTreeIcon   guifg=#FF0000
endfunction

function! s:defx.listener()
  call defx#custom#option('_', {
    \ 'columns': 'mark:indent:git:icons:filename',
    \ 'winwidth': 30,
    \ 'split': 'vertical',
    \ 'direction': "topleft",
    \ 'ignored_files': '*.swp,.git,.svn,.DS_Store',
    \ 'show_ignored_files': 0,
    \ 'toggle': 1,
    \ 'resume': 1
  \ })

  call defx#custom#column('mark', {
    \ 'readonly_icon': '✗',
    \ 'selected_icon': '✓',
  \ })

  call defx#custom#column('icon', {
    \ 'directory_icon': '▷',
    \ 'opened_icon': '▽',
    \ 'root_icon': ' ',
  \ })

  call defx#custom#column('filename', {
    \ 'max_width': 1000,
  \ })

  let key_toggle = materia#conf('packages.defx.key_toggle')
  execute 'nnoremap <silent> '. key_toggle .' :<C-u>Defx -buffer-name=tab`tabpagenr()` `getcwd()`<CR>'

  function! s:defx_mappings() abort
      nnoremap <silent><buffer><expr> o
        \ defx#is_directory() ?
        \ defx#do_action('open_tree', 'toggle') :
        \ defx#do_action('drop')

      nnoremap <silent><buffer><expr> P     defx#do_action('search',
	      \ fnamemodify(defx#get_candidate().action__path, ':h'))
      nnoremap <silent><buffer><expr> i     defx#do_action('drop', 'vsplit')
      nnoremap <silent><buffer><expr> I     defx#do_action('toggle_ignored_files')
      nnoremap <silent><buffer><expr> j     line('.') == line('$') ? 'gg' : 'j'
      nnoremap <silent><buffer><expr> k     line('.') == 1 ? 'G' : 'k'
      nnoremap <silent><buffer><expr> C     defx#do_action('cd', defx#get_candidate().action__path)
      nnoremap <silent><buffer><expr> U     defx#do_action('cd', ['..'])
      nnoremap <silent><buffer><expr> v     defx#do_action('preview')
      nnoremap <silent><buffer><expr> >     defx#do_action('resize', defx#get_context().winwidth + 4)
      nnoremap <silent><buffer><expr> <     defx#do_action('resize', defx#get_context().winwidth - 4)
      nnoremap <silent><buffer><expr> cp    defx#do_action('copy')
      nnoremap <silent><buffer><expr> p     defx#do_action('paste')
      nnoremap <silent><buffer><expr> mv    defx#do_action('move')
      nnoremap <silent><buffer><expr> r!    defx#do_action('remove')
      nnoremap <silent><buffer><expr> rm    defx#do_action('remove_trash')
      nnoremap <silent><buffer><expr> rn    defx#do_action('rename')
      nnoremap <silent><buffer><expr> nf    defx#do_action('new_file')
      nnoremap <silent><buffer><expr> nd    defx#do_action('new_directory')
      nnoremap <silent><buffer><expr> py    defx#do_action('yank_path')
      nnoremap <silent><buffer><expr> se    defx#do_action('execute_command', 'open .')
      nnoremap <silent><buffer><expr> cd    defx#do_action('change_vim_cwd')
      nnoremap <silent><buffer><expr> ;     defx#do_action('repeat')
      nnoremap <silent><buffer><expr> <C-n> defx#do_action('toggle_select') . 'j'
      nnoremap <silent><buffer><expr> <C-p> defx#do_action('toggle_select') . 'k'
      nnoremap <silent><buffer><expr> <C-o> defx#do_action('toggle_select')
      nnoremap <silent><buffer><expr> <ESC> defx#do_action('clear_select_all')
      "nnoremap <silent><buffer><expr> se defx#do_action('save_session')
      "nnoremap <silent><buffer><expr> sl defx#do_action('load_session')
      nnoremap <silent><buffer><expr> q defx#do_action('quit')
  endfunction

  " https://github.com/Shougo/defx.nvim/issues/175
  function! s:open_defx_if_directory()
      try
        let l:full_path = expand(expand('%:p'))
      catch
        return
      endtry
      if isdirectory(l:full_path)
        execute "Defx -split=no -search=`expand('%:p')` | bd " . expand('%:r')
      endif
  endfunction

  autocmd FileType defx setlocal number
  autocmd FileType defx setlocal relativenumber
  autocmd FileType defx call s:defx_mappings()
  autocmd BufEnter * call s:open_defx_if_directory()
endfunction

function! s:defx.install(install)
  if has('nvim')
    call a:install('Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' })
  else
    call a:install('Shougo/defx.nvim')
    call a:install('roxma/nvim-yarp')
    call a:install('roxma/vim-hug-neovim-rpc')
  endif
  call a:install('kristijanhusak/defx-icons')
  call a:install('kristijanhusak/defx-git')
endfunction

call materia#packages#add_package('defx', s:defx)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" undotree
" The plug-in visualizes undo history and makes it easier to browse and switch between different undo branches
" https://github.com/mbbill/undotree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:undotree = {'name': 'undotree'}
function! s:undotree.listener()
  let key_prefix = GetConfigMapPrefix(materia#conf('packages.undotree.basekey'))
  execute 'nnoremap <silent> '. key_prefix.edge .'u :<C-u>UndotreeToggle<CR>'
endfunction

function! s:undotree.install(install)
  call a:install('mbbill/undotree')
endfunction

call materia#packages#add_package('undotree', s:undotree)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_tmux_navigator
" Seamless navigation between tmux panes and vim splits
" https://github.com/christoomey/vim-tmux-navigator
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_tmux_navigator = {'name': 'vim-tmux-navigator'}
function! s:vim_tmux_navigator.install(install)
  call a:install('christoomey/vim-tmux-navigator')
endfunction

call materia#packages#add_package('vim_tmux_navigator', s:vim_tmux_navigator)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vista_vim
" View and search LSP symbols, tags in Vim/NeoVim.
" https://github.com/liuchengxu/vista.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vista_vim = {'name': 'vista.vim'}
function! s:vista_vim.config()
  let g:vista_sidebar_width = materia#conf('packages.vista_vim.attr_sidebar_width')
  let g:vista#renderer#enable_icon = materia#conf('packages.vista_vim.attr_enable_icon')
  let g:vista_icon_indent = materia#conf('packages.vista_vim.attr_icon_indent')
  let g:vista_default_executive = materia#conf('packages.vista_vim.attr_default_executive')
  let g:vista#executives = materia#conf('packages.vista_vim.attr_executives')
  let g:vista_executive_for = materia#conf('packages.vista_vim.attr_executive_for')
  let g:vista_fold_toggle_icons = materia#conf('packages.vista_vim.fold_toggle_icons')
  let g:vista#finders = materia#conf('packages.vista_vim.attr_finders')
  let g:vista_echo_cursor_strategy = 'floating_win'
  " The default icons can't be suitable for all the filetypes, you can extend it as you wish.
  let g:vista#renderer#icons = {
  \   "function": "\uf794",
  \   "variable": "\uf71b",
  \  }

  autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
endfunction

function! s:vista_vim.listener()
  let key_prefix = GetConfigMapPrefix(materia#conf('packages.vista_vim.basekey'))
  execute 'nnoremap <silent> '. key_prefix.view .'v :<C-u>Vista!!<CR>'
  execute 'nnoremap <silent> '. key_prefix.view .'f :<C-u>Vista finder<CR>'

  function! NearestMethodOrFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
  endfunction
  set statusline+=%{NearestMethodOrFunction()}
endfunction

function! s:vista_vim.install(install)
  call a:install('liuchengxu/vista.vim')
endfunction

call materia#packages#add_package('vista_vim', s:vista_vim)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_fugitive
" Fugitive is the premier Vim plugin for Git. Or maybe it's the premier Git plugin for Vim?
" https://github.com/tpope/vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_fugitive = {'name': 'vim-fugitive'}
function! s:undotree.option()
  set statusline+=%{FugitiveStatusline()}
endfunction

function! s:vim_fugitive.listener()
  let key_prefix = GetConfigMapPrefix(materia#conf('packages.vim_fugitive.basekey'))
  execute 'nnoremap <silent> '. key_prefix.view .'g :<C-u>Git --paginate<CR>'
  execute 'nnoremap <silent> '. key_prefix.view .'d :<C-u>Git diff<CR>'
  execute 'nnoremap <silent> '. key_prefix.view .'l :<C-u>Git log<CR>'
  execute 'nnoremap <silent> '. key_prefix.view .'r :<C-u>Git reflog<CR>'
  execute 'nnoremap <silent> '. key_prefix.view .'b :<C-u>Git blame<CR>'
  execute 'nnoremap <silent> '. key_prefix.win .'m :<C-u>Git mergetool<CR>'
  execute 'nnoremap <silent> '. key_prefix.win .'d :<C-u>Git difftool<CR>'
  execute 'nnoremap <silent> '. key_prefix.win .'s :<C-u>Gdiffsplit<CR>'
  execute 'nnoremap <silent> '. key_prefix.win .'o :<C-u>GBrowse<CR>'
  execute 'nnoremap <silent> '. key_prefix.action .'r :<C-u>Gread<CR>'
  execute 'nnoremap <silent> '. key_prefix.action .'w :<C-u>Gwrite<CR>'
endfunction

function! s:vim_fugitive.install(install)
  call a:install('tpope/vim-fugitive')
endfunction

call materia#packages#add_package('vim_fugitive', s:vim_fugitive)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_gitgutter
" A Vim plugin which shows a git diff in the sign column.
" https://github.com/airblade/vim-gitgutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_gitgutter = {'name': 'vim-gitgutter'}
function! s:vim_gitgutter.option()
  set foldtext=gitgutter#fold#foldtext()
endfunction

function! s:vim_gitgutter.config()
  let g:gitgutter_max_signs = -1
  let g:gitgutter_map_keys = 0
  let g:gitgutter_preview_win_floating = 1
endfunction

function! s:vim_gitgutter.listener()
  let okey = materia#conf('packages.vim_gitgutter.basekey')
  let nkey = materia#conf('options.maps.next')
  let pkey = materia#conf('options.maps.prev')
  let key_prefix = GetConfigMapPrefix(materia#conf('packages.vim_gitgutter.basekey'))
  highlight! link SignColumn LineNr 
  " Jump to hunks
  execute 'nmap '. key_prefix.next .' <Plug>(GitGutterNextHunk)'
  execute 'nmap '. key_prefix.prev .' <Plug>(GitGutterPrevHunk)'

  execute 'nmap '. key_prefix.view .'h :<C-u>GitGutterToggle<CR>'
  execute 'nmap '. key_prefix.view .'b :<C-u>GitGutterBufferToggle<CR>'
  execute 'nmap '. key_prefix.view .'i :<C-u>GitGutterSignsToggle<CR>'
  execute 'nmap '. key_prefix.view .'l :<C-u>GitGutterLineHighlightsToggle<CR>'
  execute 'nmap '. key_prefix.view .'n :<C-u>GitGutterLineNrHighlightsToggle<CR>'
  execute 'nmap '. key_prefix.view .'f :<C-u>GitGutterFold<CR>'
  execute 'nmap '. key_prefix.view .'p :<C-u>GitGutterPreviewHunk<CR>'
  execute 'nmap '. key_prefix.action .'s <Plug>(GitGutterStageHunk)'
  execute 'nmap '. key_prefix.action .'u <Plug>(GitGutterUndoHunk)'

  function! GitStatus()
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('+%d ~%d -%d', a, m, r)
  endfunction
  set statusline+=%{GitStatus()}
endfunction

function! s:vim_gitgutter.install(install)
  call a:install('airblade/vim-gitgutter')
endfunction

call materia#packages#add_package('vim_gitgutter', s:vim_gitgutter)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" materia_session
" The automated Vim/Neovim session management for Materia.
" https://github.com/speed-sonic/vim-materia-session
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:materia_session = {'name': 'vim-materia-session'}
function! s:materia_session.config()
  let g:materia_session_mode = materia#conf('packages.materia_session.mode')
  let g:materia_session_directory = materia#homepath('/temp/sessions')
  let g:session_autosave_on_actions = materia#conf('packages.materia_session.autosave_on_actions')
endfunction

function! s:materia_session.listener()
  if g:loaded_materia_session
    if materia#conf('packages.materia_session.autoload')
      call MateriaSessionLoad()
    endif
    if materia#conf('packages.materia_session.autosave')
      autocmd VimLeavePre * call MateriaSessionSave()
    endif
  endif
endfunction

function! s:materia_session.install(install)
  call a:install('speed-sonic/vim-materia-session')
endfunction

call materia#packages#add_package('materia_session', s:materia_session)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_virtualenv
" Vim plugin for working with python virtualenvs.
" https://github.com/jmcantrell/vim-virtualenv
"
" virtualenv -p python envdir_name
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_virtualenv = {'name': 'vim-virtualenv'}
function! s:vim_virtualenv.config()
  let conf = materia#conf('packages.vim_virtualenv.virtualenv_directory')
  if type(conf) == type('')
    let g:virtualenv_directory = conf
  else
    let g:virtualenv_directory = g:materia#path#home
  endif
endfunction

function! s:vim_virtualenv.install(install)
  call a:install('jmcantrell/vim-virtualenv')
endfunction

call materia#packages#add_package('vim_virtualenv', s:vim_virtualenv)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp
" Active fork of kien/ctrlp.vim—Fuzzy file, buffer, mru, tag, etc finder.
" https://github.com/ctrlpvim/ctrlp.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:ctrlp = {'name': 'ctrlp.vim'}
function! s:ctrlp.config()
  let g:ctrlp_map = materia#conf('packages.ctrlp.attr_map')
  let g:ctrlp_cmd = materia#conf('packages.ctrlp.attr_cmd')
  let g:ctrlp_working_path_mode = materia#conf('packages.ctrlp.attr_working_path_mode')
  let g:ctrlp_root_markers = ['.git', '.hg', '.svn', '.bzr', '_darcs'] + materia#conf('packages.ctrlp.attr_root_markers')
  let g:ctrlp_show_hidden = materia#conf('packages.ctrlp.attr_show_hidden')
  let g:ctrlp_use_caching = materia#conf('packages.ctrlp.attr_use_caching')
  let g:ctrlp_clear_cache_on_exit = materia#conf('packages.ctrlp.attr_clear_cache_on_exit')
  let g:ctrlp_cache_dir = materia#homepath('/temp/ctrlp')
  " ignores
  let g:ctrlp_custom_ignore = materia#homepath('/temp/ignore')
endfunction

function! s:ctrlp.install(install)
  call a:install('ctrlpvim/ctrlp.vim')
endfunction

call materia#packages#add_package('ctrlp', s:ctrlp)
