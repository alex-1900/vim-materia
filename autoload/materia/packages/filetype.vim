"=============================================================================
" FILE: filetype.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => html5_vim
" HTML5 + inline SVG omnicomplete function, indent and syntax for Vim. Based on the default htmlcomplete.vim.
" https://github.com/othree/html5.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:html5_vim = {}
function! s:html5_vim.listener()
  autocmd FileType html,css EmmetInstall
endfunction
function! s:html5_vim.install(install)
  call a:install('othree/html5.vim')
endfunction
call materia#modules#add_package('html5_vim', s:html5_vim)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => emmet_vim
" emmet-vim is a vim plug-in which provides support for expanding abbreviations similar to emmet.
" https://github.com/mattn/emmet-vim
" snippets.json Doc:
" https://docs.emmet.io/customization/snippets/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:emmet_vim = {}
function! s:emmet_vim.config()
  if materia#conf('html.snippet_path')
    let s:snippet_path = materia#conf('html.snippet_path')
    let g:user_emmet_settings = webapi#json#decode(join(readfile(expand(s:snippet_path)), "\n"))
  endif
endfunction
function! s:emmet_vim.install(install)
  call a:install('mattn/emmet-vim')
endfunction
call materia#modules#add_package('emmet_vim', s:emmet_vim)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => syntastic
" Syntastic is a syntax checking plugin for Vim created by Martin Grenfell.
" It runs files through external syntax checkers and displays any resulting errors to the user.
" https://github.com/vim-syntastic/syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:syntastic = {}
function! s:syntastic.options()
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
endfunction
function! s:syntastic.config()
  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
endfunction
function! s:syntastic.install(install)
  call a:install('vim-syntastic/syntastic')
endfunction
call materia#modules#add_package('syntastic', s:syntastic)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => nginx
" Improved nginx vim plugin (incl. syntax highlighting)
" https://github.com/chr4/nginx.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:nginx = {}
function! s:nginx.install(install)
  call a:install('chr4/nginx.vim')
endfunction
call materia#modules#add_package('nginx', s:nginx)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_go
" Go development plugin for Vim
" https://github.com/fatih/vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_go = {}
function! s:vim_go.config()
  let g:go_def_mode='gopls'
  let g:go_info_mode='gopls'
  let g:go_fmt_autosave = 0
  let g:go_fmt_command = 'goimports'
  let g:go_fmt_fail_silently = 1
  " this breaks folding on vim < 8.0 or neovim
  if v:version >= 800 || has('nvim')
    let g:go_fmt_experimental = 1
  endif
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_generate_tags = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_types = 1
  " let g:go_highlight_function_calls = 1
endfunction
function! s:vim_go.listener()
  autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
  autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
  autocmd FileType go nmap gty :CocCommand go.tags.add yaml<cr>
  autocmd FileType go nmap gtx :CocCommand go.tags.clear<cr>
endfunction
function! s:vim_go.install(install)
  call a:install('fatih/vim-go', { 'do': ':GoUpdateBinaries' })
endfunction
call materia#modules#add_package('vim_go', s:vim_go)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_javascript
" JavaScript bundle for vim, this bundle provides syntax highlighting and improved indentation.
" https://github.com/pangloss/vim-javascript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_javascript = {}
function! s:vim_javascript.config()
  let g:javascript_plugin_jsdoc = 1
endfunction
function! s:vim_javascript.install(install)
  call a:install('pangloss/vim-javascript')
endfunction
call materia#modules#add_package('vim_javascript', s:vim_javascript)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_json
" A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing. Pathogen-friendly.
" https://github.com/elzr/vim-json
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_json = {}
function! s:vim_json.options()
  set conceallevel=0
endfunction
function! s:vim_json.config()
  let g:vim_json_syntax_conceal = 0
endfunction
function! s:vim_json.install(install)
  call a:install('elzr/vim-json')
endfunction
call materia#modules#add_package('vim_json', s:vim_json)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_jsx
" React JSX syntax highlighting and indenting for vim.
" https://github.com/mxw/vim-jsx
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_jsx = {}
function! s:vim_jsx.install(install)
  call a:install('mxw/vim-jsx')
endfunction
call materia#modules#add_package('vim_jsx', s:vim_jsx)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_markdown
" This is the development version of Vim's included syntax highlighting and filetype plugins for Markdown.
" https://github.com/tpope/vim-markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_markdown = {}
function! s:vim_markdown.config()
  let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
endfunction
function! s:vim_markdown.install(install)
  call a:install('tpope/vim-markdown')
endfunction
call materia#modules#add_package('vim_markdown', s:vim_markdown)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_livedown
" https://github.com/shime/vim-livedown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_livedown = {}
function! s:vim_livedown.listener()
  nnoremap <silent> <leader>ml <C-u>:LivedownToggle<CR>
endfunction
function! s:vim_livedown.install(install)
  call a:install('shime/vim-livedown', { 'do': 'yarn global add livedown' })
endfunction
call materia#modules#add_package('vim_livedown', s:vim_livedown)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_peekaboo
" Peekaboo will show you the contents of the registers on the sidebar when you hit " or @ in normal mode or <CTRL-R> in insert mode.
" The sidebar is automatically closed on subsequent key strokes.
" You can toggle fullscreen mode by pressing spacebar.
" https://github.com/junegunn/vim-peekaboo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_peekaboo = {}
function! s:vim_peekaboo.install(install)
  call a:install('junegunn/vim-peekaboo')
endfunction
call materia#modules#add_package('vim_peekaboo', s:vim_peekaboo)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_floaterm
" Use (neo)vim terminal in the floating/popup window.
" https://github.com/voldikss/vim-floaterm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_floaterm = {}
function! s:vim_floaterm.options()
  " Set floaterm window's background to black
  hi Floaterm guibg=black
  " Set floating window border line color to cyan, and background to orange
  hi FloatermBorder guibg=orange guifg=cyan
  " Set floaterm window background to gray once the cursor moves out from it
  hi FloatermNC guibg=gray
endfunction
function! s:vim_floaterm.config()
  let g:floaterm_keymap_new = '<Leader>tn'
  let g:floaterm_keymap_prev = '<Leader>th'
  let g:floaterm_keymap_next = '<Leader>tl'
  let g:floaterm_keymap_toggle = '<leader>tt'
endfunction
function! s:vim_floaterm.listener()
  tnoremap <silent> <leader>tk <C-\><C-n>:FloatermKill<CR>
endfunction
function! s:vim_floaterm.install(install)
  call a:install('voldikss/vim-floaterm')
endfunction
call materia#modules#add_package('vim_floaterm', s:vim_floaterm)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim_smooth_scroll
" Use (neo)vim terminal in the floating/popup window.
" https://github.com/voldikss/vim-floaterm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_smooth_scroll = {}
function! s:vim_smooth_scroll.listener()
  noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 6, 1)<CR>
  noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 6, 1)<CR>
  noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 6, 1)<CR>
  noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 6, 1)<CR>
endfunction
function! s:vim_smooth_scroll.install(install)
  call a:install('terryma/vim-smooth-scroll')
endfunction
call materia#modules#add_package('vim_smooth_scroll', s:vim_smooth_scroll)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => editorconfig_vim
" This is an EditorConfig plugin for Vim. This plugin can be found on both GitHub and Vim online.
" https://github.com/editorconfig/editorconfig-vim
" https://editorconfig.org/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:editorconfig_vim = {}
function! s:editorconfig_vim.config()
  let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
endfunction
function! s:editorconfig_vim.listener()
  autocmd FileType gitcommit let b:EditorConfig_disable = 1
endfunction
function! s:editorconfig_vim.install(install)
  call a:install('editorconfig/editorconfig-vim')
endfunction
call materia#modules#add_package('editorconfig_vim', s:editorconfig_vim)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => webapi_vim
" An Interface to WEB APIs.
" https://github.com/mattn/webapi-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:webapi_vim = {}
function! s:webapi_vim.install(install)
  call a:install('mattn/webapi-vim')
endfunction
call materia#modules#add_package('webapi_vim', s:webapi_vim)
