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
let defx = {'id': 'defx', 'directory': 'defx.nvim'}
function! defx.preloader()
  let g:defx_icons_enable_syntax_highlight = 1
  let g:defx_icons_column_length = 1

  " highlight groups for defx-icons
  hi DefxIconsDirectory        guifg=#F0E68C
  hi DefxIconsParentDirectory  guifg=#EEE8AA
  hi DefxIconsSymlinkDirectory guifg=#FF0000
  hi DefxIconsOpenedTreeIcon   guifg=#F0E68C
  hi DefxIconsNestedTreeIcon   guifg=#BDB76B
  hi DefxIconsClosedTreeIcon   guifg=#F0E68C
  hi Defx_filename_root        guifg=#F5F5DC
  hi Defx_filename_directory   guifg=#F5F5DC
endfunction

function! defx.loader()
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

  let key_prefix = GetConfigMapPrefix(materia#conf('parts.defx.key_state'))
  execute 'nnoremap <silent> '. key_prefix.state .' :<C-u>Defx -buffer-name=tab`tabpagenr()` `getcwd()`<CR>'

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

function! defx.installer(install)
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

call materia#part#add(defx)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" undotree
" The plug-in visualizes undo history and makes it easier to browse and switch between different undo branches
" https://github.com/mbbill/undotree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let undotree = {'id': 'undotree', 'directory': 'undotree'}
function! undotree.loader()
  let key_prefix = GetConfigMapPrefix(materia#conf('parts.undotree.key_state'))
  execute 'nnoremap <silent> '. key_prefix.state .' :<C-u>UndotreeToggle<CR>'
endfunction

function! undotree.installer(install)
  call a:install('mbbill/undotree')
endfunction

call materia#part#add(undotree)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_tmux_navigator
" Seamless navigation between tmux panes and vim splits
" https://github.com/christoomey/vim-tmux-navigator
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vim_tmux_navigator = {'id': 'vim_tmux_navigator', 'directory': 'vim-tmux-navigator'}
function! vim_tmux_navigator.installer(install)
  call a:install('christoomey/vim-tmux-navigator')
endfunction

call materia#part#add(vim_tmux_navigator)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vista_vim
" View and search LSP symbols, tags in Vim/NeoVim.
" https://github.com/liuchengxu/vista.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vista_vim = {'id': 'vista_vim', 'directory': 'vista.vim'}
function! vista_vim.preloader()
  let g:vista_sidebar_width = materia#conf('parts.vista_vim.attr_sidebar_width')
  let g:vista#renderer#enable_icon = materia#conf('parts.vista_vim.attr_enable_icon')
  let g:vista_icon_indent = ['╰─▸ ', '├─▸ ']
  let g:vista_default_executive = materia#conf('parts.vista_vim.attr_default_executive')
  let g:vista_executive_for = {}
  let g:vista_fzf_preview = ['right:50%']
  let g:vista_fold_toggle_icons = ["▼", "▶"]
  let g:vista#finders = materia#conf('parts.vista_vim.attr_finders')
  let g:vista_echo_cursor_strategy = 'floating_win'
  let g:vista_update_on_text_changed = 1
  let g:vista_update_on_text_changed_delay = 2000
  " The default icons can't be suitable for all the filetypes, you can extend it as you wish.
  let g:vista#renderer#icons = {
  \   "function": "\uf794",
  \   "variable": "\uf71b",
  \  }

  autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
endfunction

function! vista_vim.loader()
  let key_prefix = GetConfigMapPrefix(materia#conf('parts.vista_vim.key_state'))
  execute 'nnoremap <silent> '. key_prefix.state .'v :<C-u>Vista!!<CR>'
  execute 'nnoremap <silent> '. key_prefix.state .'f :<C-u>Vista finder<CR>'

  function! NearestMethodOrFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
  endfunction
  set statusline+=%{NearestMethodOrFunction()}
endfunction

function! vista_vim.installer(install)
  call a:install('liuchengxu/vista.vim')
endfunction

call materia#part#add(vista_vim)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_fugitive
" Fugitive is the premier Vim plugin for Git. Or maybe it's the premier Git plugin for Vim?
" https://github.com/tpope/vim-fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vim_fugitive = {'id': 'vim_fugitive', 'directory': 'vim-fugitive'}
function! undotree.option()
  set statusline+=%{FugitiveStatusline()}
endfunction

function! vim_fugitive.loader()
  let key_prefix = GetConfigMapPrefix(materia#conf('parts.vim_fugitive.basekey'))
  execute 'nnoremap <silent> '. key_prefix.reader .'g :<C-u>Git --paginate<CR>'
  execute 'nnoremap <silent> '. key_prefix.reader .'d :<C-u>Git diff<CR>'
  execute 'nnoremap <silent> '. key_prefix.reader .'l :<C-u>Git log<CR>'
  execute 'nnoremap <silent> '. key_prefix.reader .'r :<C-u>Git reflog<CR>'
  execute 'nnoremap <silent> '. key_prefix.reader .'b :<C-u>Git blame<CR>'
  execute 'nnoremap <silent> '. key_prefix.state .'m :<C-u>Git mergetool<CR>'
  execute 'nnoremap <silent> '. key_prefix.state .'d :<C-u>Git difftool<CR>'
  execute 'nnoremap <silent> '. key_prefix.state .'s :<C-u>Gdiffsplit<CR>'
  execute 'nnoremap <silent> '. key_prefix.state .'o :<C-u>GBrowse<CR>'
  execute 'nnoremap <silent> '. key_prefix.writer .'r :<C-u>Gread<CR>'
  execute 'nnoremap <silent> '. key_prefix.writer .'w :<C-u>Gwrite<CR>'
endfunction

function! vim_fugitive.installer(install)
  call a:install('tpope/vim-fugitive')
endfunction

call materia#part#add(vim_fugitive)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_gitgutter
" A Vim plugin which shows a git diff in the sign column.
" https://github.com/airblade/vim-gitgutter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vim_gitgutter = {'id': 'vim_gitgutter', 'directory': 'vim-gitgutter'}
function! vim_gitgutter.option()
  set foldtext=gitgutter#fold#foldtext()
endfunction

function! vim_gitgutter.preloader()
  let g:gitgutter_max_signs = -1
  let g:gitgutter_map_keys = 0
  let g:gitgutter_preview_win_floating = 1
endfunction

function! vim_gitgutter.loader()
  let okey = materia#conf('parts.vim_gitgutter.basekey')
  let nkey = materia#conf('key.next')
  let pkey = materia#conf('key.prev')
  let key_prefix = GetConfigMapPrefix(materia#conf('parts.vim_gitgutter.basekey'))
  highlight! link SignColumn LineNr 
  " Jump to hunks
  execute 'nmap '. key_prefix.next .' <Plug>(GitGutterNextHunk)'
  execute 'nmap '. key_prefix.prev .' <Plug>(GitGutterPrevHunk)'

  execute 'nmap '. key_prefix.reader .'h :<C-u>GitGutterToggle<CR>'
  execute 'nmap '. key_prefix.reader .'b :<C-u>GitGutterBufferToggle<CR>'
  execute 'nmap '. key_prefix.reader .'i :<C-u>GitGutterSignsToggle<CR>'
  execute 'nmap '. key_prefix.reader .'l :<C-u>GitGutterLineHighlightsToggle<CR>'
  execute 'nmap '. key_prefix.reader .'n :<C-u>GitGutterLineNrHighlightsToggle<CR>'
  execute 'nmap '. key_prefix.reader .'f :<C-u>GitGutterFold<CR>'
  execute 'nmap '. key_prefix.reader .'p :<C-u>GitGutterPreviewHunk<CR>'
  execute 'nmap '. key_prefix.writer .'s <Plug>(GitGutterStageHunk)'
  execute 'nmap '. key_prefix.writer .'u <Plug>(GitGutterUndoHunk)'

  function! GitStatus()
    let [a,m,r] = GitGutterGetHunkSummary()
    return printf('+%d ~%d -%d', a, m, r)
  endfunction
  set statusline+=%{GitStatus()}
endfunction

function! vim_gitgutter.installer(install)
  call a:install('airblade/vim-gitgutter')
endfunction

call materia#part#add(vim_gitgutter)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_smooth_scroll
" Make scrolling in Vim more pleasant
" https://github.com/terryma/vim-smooth-scroll
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vim_smooth_scroll = {'id': 'vim_smooth_scroll', 'directory': 'vim-smooth-scroll'}
function! vim_smooth_scroll.loader()
  let speed = materia#conf('parts.vim_smooth_scroll.speed')
  execute 'noremap <silent> <c-u> :call smooth_scroll#up(&scroll, '. speed .', 1)<CR>'
  execute 'noremap <silent> <c-d> :call smooth_scroll#down(&scroll, '. speed .', 1)<CR>'
  execute 'noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, '. speed .', 1)<CR>'
  execute 'noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, '. speed .', 1)<CR>'
endfunction
function! vim_smooth_scroll.installer(install)
  call a:install('terryma/vim-smooth-scroll')
endfunction
call materia#part#add(vim_smooth_scroll)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_floaterm
" Use (neo)vim terminal in the floating/popup window.
" https://github.com/voldikss/vim-floaterm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vim_floaterm = {'id': 'vim_floaterm', 'directory': 'vim-floaterm'}

function! vim_floaterm.preloader()
  " Set floaterm window's background to black
  hi Floaterm guibg=black
  " Set floating window border line color to cyan, and background to orange
  hi FloatermBorder guibg=orange guifg=cyan
  " Set floaterm window background to gray once the cursor moves out from it
  hi FloatermNC guibg=gray

  let okey = materia#conf('parts.vim_floaterm.basekey')
  let nkey = materia#conf('key.next')
  let pkey = materia#conf('key.prev')
  let key_prefix = GetConfigMapPrefix(okey)
  let g:floaterm_keymap_new = key_prefix.state . 'n'
  let g:floaterm_keymap_prev = pkey . okey
  let g:floaterm_keymap_next = nkey . okey
  let g:floaterm_keymap_toggle = key_prefix.state . 't'
  let g:floaterm_keymap_kill = '<C-d>'
  let g:floaterm_title = materia#conf('parts.vim_floaterm.title')
  let g:floaterm_width = materia#conf('parts.vim_floaterm.width')
  let g:floaterm_height = materia#conf('parts.vim_floaterm.height')
  let g:floaterm_rootmarkers = materia#conf('parts.vim_floaterm.rootmarkers')
  " Close window if the job exits normally, otherwise stay it with messages like [Process exited 101]
  let g:floaterm_autoclose = 0
endfunction

function! vim_floaterm.installer(install)
  call a:install('voldikss/vim-floaterm')
endfunction

call materia#part#add(vim_floaterm)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_peekaboo
" Peekaboo will show you the contents of the registers on the sidebar when you hit " or @ in normal mode or <CTRL-R> in insert mode.
" The sidebar is automatically closed on subsequent key strokes.
" You can toggle fullscreen mode by pressing spacebar.
" https://github.com/junegunn/vim-peekaboo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vim_peekaboo = {'id': 'vim_peekaboo', 'directory': 'vim-peekaboo'}
function! vim_peekaboo.preloader()
  let g:peekaboo_delay = materia#conf('parts.vim_peekaboo.attr_delay')
  let g:peekaboo_compact = materia#conf('parts.vim_peekaboo.attr_compact')
  let g:peekaboo_prefix = materia#conf('parts.vim_peekaboo.attr_prefix')
  let g:peekaboo_ins_prefix = materia#conf('parts.vim_peekaboo.attr_ins_prefix')
endfunction
function! vim_peekaboo.installer(install)
  call a:install('junegunn/vim-peekaboo')
endfunction
call materia#part#add(vim_peekaboo)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" materia_session
" The automated Vim/Neovim session management for Materia.
" https://github.com/alex9201/vim-materia-session
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let materia_session = {'id': 'materia_session', 'directory': 'vim-materia-session'}
function! materia_session.preloader()
  let g:materia_session_mode = materia#conf('parts.materia_session.mode')
  let g:materia_session_directory = materia#homepath('/temp/sessions')
  let g:session_autosave_on_actions = materia#conf('parts.materia_session.autosave_on_actions')
endfunction

function! materia_session.loader()
  if g:loaded_materia_session
    if materia#conf('parts.materia_session.autoload')
      call MateriaSessionLoad()
    endif
    if materia#conf('parts.materia_session.autosave')
      autocmd VimLeavePre * call MateriaSessionSave()
    endif
  endif
endfunction

function! materia_session.installer(install)
  call a:install('alex9201/vim-materia-session')
endfunction

call materia#part#add(materia_session)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_virtualenv
" Vim plugin for working with python virtualenvs.
" https://github.com/jmcantrell/vim-virtualenv
"
" virtualenv -p python envdir_name
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vim_virtualenv = {'id': 'vim_virtualenv', 'directory': 'vim-virtualenv'}
function! vim_virtualenv.preloader()
  let conf = materia#conf('parts.vim_virtualenv.virtualenv_directory')
  if type(conf) == type('')
    let g:virtualenv_directory = conf
  else
    let g:virtualenv_directory = g:materia#path#home
  endif
endfunction

function! vim_virtualenv.installer(install)
  call a:install('jmcantrell/vim-virtualenv')
endfunction

call materia#part#add(vim_virtualenv)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp
" Active fork of kien/ctrlp.vim—Fuzzy file, buffer, mru, tag, etc finder.
" https://github.com/ctrlpvim/ctrlp.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let ctrlp = {'id': 'ctrlp', 'directory': 'ctrlp.vim'}
function! ctrlp.preloader()
  let key_prefix = GetConfigMapPrefix(materia#conf('parts.ctrlp.key_state'))
  let g:ctrlp_map = key_prefix.state
  let g:ctrlp_cmd = materia#conf('parts.ctrlp.attr_cmd')
  let g:ctrlp_working_path_mode = materia#conf('parts.ctrlp.attr_working_path_mode')
  let g:ctrlp_root_markers = ['.git', '.hg', '.svn', '.bzr', '_darcs'] + materia#conf('parts.ctrlp.attr_root_markers')
  let g:ctrlp_show_hidden = materia#conf('parts.ctrlp.attr_show_hidden')
  let g:ctrlp_use_caching = materia#conf('parts.ctrlp.attr_use_caching')
  let g:ctrlp_clear_cache_on_exit = materia#conf('parts.ctrlp.attr_clear_cache_on_exit')
  let g:ctrlp_cache_dir = materia#homepath('/temp/ctrlp')
  " ignores
  let g:ctrlp_custom_ignore = materia#homepath('/temp/ignore')
endfunction

function! ctrlp.installer(install)
  call a:install('ctrlpvim/ctrlp.vim')
endfunction

call materia#part#add(ctrlp)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" webapi
" vim interface to Web API
" https://github.com/mattn/webapi-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let webapi = {'id': 'webapi', 'directory': 'webapi-vim'}

function! webapi.installer(install)
  call a:install('mattn/webapi-vim')
endfunction

call materia#part#add(webapi)
