"=============================================================================
" FILE: filetype.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" html5_vim
" HTML5 + inline SVG omnicomplete function, indent and syntax for Vim. Based on the default htmlcomplete.vim.
" https://github.com/othree/html5.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:html5_vim = {'name': 'html5.vim'}
function! s:html5_vim.config()
  let g:html5_event_handler_attributes_complete = materia#conf('packages.html5_vim.attr_event_handler')
  let g:html5_rdfa_attributes_complete = materia#conf('packages.html5_vim.attr_rdfa')
  let g:html5_microdata_attributes_complete = materia#conf('packages.html5_vim.attr_microdata')
  let g:html5_aria_attributes_complete = materia#conf('packages.html5_vim.attr_aria')
endfunction
function! s:html5_vim.listener()
  let filetypes = materia#conf('packages.html5_vim.filetypes')
  execute 'autocmd FileType '. join(filetypes, ',') .' EmmetInstall'
endfunction
function! s:html5_vim.install(install)
  call a:install('othree/html5.vim')
endfunction
call materia#packages#add('html5_vim', s:html5_vim)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" emmet_vim
" emmet-vim is a vim plug-in which provides support for expanding abbreviations similar to emmet.
" https://github.com/mattn/emmet-vim
" snippets.json Doc:
" https://docs.emmet.io/customization/snippets/
"
" An Interface to WEB APIs.
" https://github.com/mattn/webapi-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:emmet_vim = {'name': 'emmet-vim'}
function! s:emmet_vim.config()
  if materia#conf('html.snippet_path')
    let g:user_emmet_install_global = 0
    let snippet_path = materia#conf('packages.emmet_vim.snippet_path')
    if snippet_path
      let g:user_emmet_settings = webapi#json#decode(join(readfile(expand(s:snippet_path)), "\n"))
    endif
  endif
  let g:user_emmet_leader_key = '<C-' . materia#conf('packages.emmet_vim.key_ctrl') . '>'
endfunction
function! s:emmet_vim.listener()
  if (exists('g:loaded_emmet_vim') && g:loaded_emmet_vim)
    let filetypes = materia#conf('packages.emmet_vim.filetypes')
    execute 'autocmd FileType '. join(filetypes, ',') .' EmmetInstall'
  endif
endfunction
function! s:emmet_vim.install(install)
  call a:install('mattn/emmet-vim')
  call a:install('mattn/webapi-vim')
endfunction
call materia#packages#add('emmet_vim', s:emmet_vim)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic
" Syntastic is a syntax checking plugin for Vim created by Martin Grenfell.
" It runs files through external syntax checkers and displays any resulting errors to the user.
" https://github.com/vim-syntastic/syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:syntastic = {'name': 'syntastic'}
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
call materia#packages#add('syntastic', s:syntastic)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nginx
" Improved nginx vim plugin (incl. syntax highlighting)
" https://github.com/chr4/nginx.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:nginx = {'name': 'nginx.vim'}
function! s:nginx.install(install)
  call a:install('chr4/nginx.vim')
endfunction
call materia#packages#add('nginx', s:nginx)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_go
" Go development plugin for Vim
" https://github.com/fatih/vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_go = {'name': 'vim-go'}
function! s:vim_go.config()
  " modes
  let g:go_def_mode = 'gopls'
  let g:go_info_mode='gopls'
  let g:go_referrers_mode = 'gopls'
  let g:go_imports_mode = "goimports"
  let g:go_implements_mode = 'gopls'
  " commands
  let g:go_fmt_command='gofmt'
  let g:go_rename_command = 'gopls'
  " options
  let g:go_fmt_options = {}
  let g:go_gopls_options = ['-remote=auto']
  " autosave
  let g:go_fmt_autosave = materia#conf('packages.vim_go.fmt_autosave')
  let g:go_mod_fmt_autosave = materia#conf('packages.vim_go.mod_fmt_autosave')
  let g:go_imports_autosave = materia#conf('packages.vim_go.imports_autosave')
  let g:go_fmt_fail_silently = 1
  " features
  let g:go_gopls_enabled = 1
  let g:go_code_completion_enabled = 1
  " Status line types/signatures
  let g:go_auto_type_info = 1
  let g:go_doc_popup_window = 1
  " This is disabled to use coc-go, vim-go just use commands
  let g:go_def_mapping_enabled = 0
  " this breaks folding on vim < 8.0 or neovim
  if v:version >= 800 || has('nvim')
    let g:go_fmt_experimental = 1
  endif
  " highlight options
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_build_constraints = 1

  if materia#conf('packages.vim_go.extra_highlight')
    let g:go_highlight_extra_types = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_function_parameters = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_generate_tags = 1
    let g:go_highlight_string_spellcheck = 1
    let g:go_highlight_format_strings = 1
    let g:go_highlight_variable_declarations = 1
    let g:go_highlight_variable_assignments = 1
  endif

  " go metalinter
  let g:go_metalinter_autosave_enabled = ['all']
  let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
  let g:go_metalinter_command = "golangci-lint"

  " key mappings
  let localaction = materia#conf('key.localaction')
  " executecurrent file(s) gl
  execute 'autocmd FileType go nmap <buffer> <silent> '. localaction .'r <Plug>(go-run)'
  execute 'autocmd FileType go nmap <buffer> <silent> '. localaction .'b <Plug>(go-build)'
  execute 'autocmd FileType go nmap <buffer> <silent> '. localaction .'i <Plug>(go-install)'
  execute 'autocmd FileType go nmap <buffer> <silent> '. localaction .'p <Plug>(go-imports)'
  execute 'autocmd FileType go nmap <buffer> <silent> '. localaction .'m <Plug>(go-metalinter)'
  execute 'autocmd FileType go nmap <buffer> <silent> '. localaction .'l <Plug>(go-lint)'
  execute 'autocmd FileType go nmap <buffer> <silent> '. localaction .'v <Plug>(go-vet)'
  execute 'autocmd FileType go nmap <buffer> <silent> '. localaction .'e <Plug>(go-alternate-edit)'
  " go test
  execute 'autocmd FileType go nmap <buffer> <silent> '. localaction .'tt <Plug>(go-test)'
  execute 'autocmd FileType go nmap <buffer> <silent> '. localaction .'tf <Plug>(go-test-func)'
  execute 'autocmd FileType go nmap <buffer> <silent> '. localaction .'tc <Plug>(go-test-compile)'

  execute 'autocmd FileType go nmap <buffer> <silent> <localleader>f <Plug>(go-files)'
  execute 'autocmd FileType go nmap <buffer> <silent> <localleader>i <Plug>(go-describe)'
  execute 'autocmd FileType go nmap <buffer> <silent> <localleader>p <Plug>(go-pointsto)'
  execute 'autocmd FileType go nmap <buffer> <silent> <localleader>w <Plug>(go-whicherrs)'
  execute 'autocmd FileType go nmap <buffer> <silent> <localleader>ce <Plug>(go-callees)'
  execute 'autocmd FileType go nmap <buffer> <silent> <localleader>cr <Plug>(go-callees)'
  execute 'autocmd FileType go nmap <buffer> <silent> <localleader>d <Plug>(go-doc)'
  execute 'autocmd FileType go nmap <buffer> <silent> <localleader>b <Plug>(go-browser)'
  " freevars
  execute 'autocmd FileType go xmap <buffer> <silent> <localleader>v <Plug>(go-freevars)'
endfunction

function! s:vim_go.install(install)
  call a:install('fatih/vim-go', { 'do': ':GoUpdateBinaries' })
endfunction

call materia#packages#add('vim_go', s:vim_go)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_javascript
" JavaScript bundle for vim, this bundle provides syntax highlighting and improved indentation.
" https://github.com/pangloss/vim-javascript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_javascript = {'name': 'vim-javascript'}
function! s:vim_javascript.config()
  let g:javascript_plugin_jsdoc = materia#conf('packages.vim_javascript.attr_plugin_jsdoc')
  let g:javascript_plugin_ngdoc = materia#conf('packages.vim_javascript.attr_plugin_ngdoc')
  let g:javascript_plugin_flow = materia#conf('packages.vim_javascript.attr_plugin_flow')

  augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
  augroup END
endfunction
function! s:vim_javascript.install(install)
  call a:install('pangloss/vim-javascript')
endfunction
call materia#packages#add('vim_javascript', s:vim_javascript)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_json
" A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing. Pathogen-friendly.
" https://github.com/elzr/vim-json
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_json = {'name': 'vim-json'}
function! s:vim_json.options()
  set conceallevel=0
endfunction
function! s:vim_json.config()
  let g:vim_json_syntax_conceal = materia#conf('packages.vim_json.syntax_conceal')
endfunction
function! s:vim_json.install(install)
  call a:install('elzr/vim-json')
endfunction
call materia#packages#add('vim_json', s:vim_json)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" typescript_vim
" Typescript syntax files for Vim
" https://github.com/leafgarland/typescript-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:typescript_vim = {'name': 'typescript-vim'}
function! s:typescript_vim.config()
  let g:typescript_compiler_binary = materia#conf('packages.typescript_vim.attr_compiler_binary')
  let g:typescript_compiler_options = materia#conf('packages.typescript_vim.attr_compiler_options')

  autocmd FileType typescript :set makeprg=tsc

  autocmd QuickFixCmdPost [^l]* nested cwindow
  autocmd QuickFixCmdPost    l* nested lwindow
endfunction

function! s:typescript_vim.install(install)
  call a:install('leafgarland/typescript-vim')
endfunction

call materia#packages#add('typescript_vim', s:typescript_vim)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_jsx
" React JSX syntax highlighting and indenting for vim.
" https://github.com/mxw/vim-jsx
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_jsx = {'name': 'vim-jsx'}
function! s:vim_jsx.install(install)
  call a:install('mxw/vim-jsx')
endfunction
call materia#packages#add('vim_jsx', s:vim_jsx)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_markdown
" This is the development version of Vim's included syntax highlighting and filetype plugins for Markdown.
" https://github.com/tpope/vim-markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_markdown = {'name': 'vim-markdown'}
function! s:vim_markdown.config()
  let g:markdown_fenced_languages = materia#conf('packages.vim_markdown.attr_fenced_languages')
  let g:markdown_minlines = materia#conf('packages.vim_markdown.attr_minlines')
endfunction
function! s:vim_markdown.install(install)
  call a:install('tpope/vim-markdown')
endfunction
call materia#packages#add('vim_markdown', s:vim_markdown)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_livedown
" https://github.com/shime/vim-livedown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_livedown = {'name': 'vim-livedown'}
function! s:vim_livedown.config()
endfunction
function! s:vim_livedown.listener()
  let localaction = materia#conf('key.localaction')
  execute 'autocmd FileType markdown nnoremap <buffer> <silent> '. localaction .'o :<C-u>LivedownToggle<CR>'
endfunction
function! s:vim_livedown.install(install)
  call a:install('shime/vim-livedown', { 'do': 'yarn global add livedown' })
endfunction
call materia#packages#add('vim_livedown', s:vim_livedown)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_peekaboo
" Peekaboo will show you the contents of the registers on the sidebar when you hit " or @ in normal mode or <CTRL-R> in insert mode.
" The sidebar is automatically closed on subsequent key strokes.
" You can toggle fullscreen mode by pressing spacebar.
" https://github.com/junegunn/vim-peekaboo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_peekaboo = {'name': 'vim-peekaboo'}
function! s:vim_peekaboo.config()
  let g:peekaboo_delay = materia#conf('packages.vim_peekaboo.attr_delay')
  let g:peekaboo_compact = materia#conf('packages.vim_peekaboo.attr_compact')
  let g:peekaboo_prefix = materia#conf('packages.vim_peekaboo.attr_prefix')
  let g:peekaboo_ins_prefix = materia#conf('packages.vim_peekaboo.attr_ins_prefix')
endfunction
function! s:vim_peekaboo.install(install)
  call a:install('junegunn/vim-peekaboo')
endfunction
call materia#packages#add('vim_peekaboo', s:vim_peekaboo)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_floaterm
" Use (neo)vim terminal in the floating/popup window.
" https://github.com/voldikss/vim-floaterm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_floaterm = {'name': 'vim-floaterm'}
function! s:vim_floaterm.options()
  " Set floaterm window's background to black
  hi Floaterm guibg=black
  " Set floating window border line color to cyan, and background to orange
  hi FloatermBorder guibg=orange guifg=cyan
  " Set floaterm window background to gray once the cursor moves out from it
  hi FloatermNC guibg=gray
endfunction
function! s:vim_floaterm.config()
  let okey = materia#conf('packages.vim_floaterm.basekey')
  let nkey = materia#conf('key.next')
  let pkey = materia#conf('key.prev')
  let key_prefix = GetConfigMapPrefix(okey)
  let g:floaterm_keymap_new = key_prefix.edge . 'n'
  let g:floaterm_keymap_prev = pkey . okey
  let g:floaterm_keymap_next = nkey . okey
  let g:floaterm_keymap_toggle = key_prefix.edge . 't'
  let g:floaterm_keymap_kill = '<C-d>'
  let g:floaterm_title = materia#conf('packages.vim_floaterm.title')
  let g:floaterm_width = materia#conf('packages.vim_floaterm.width')
  let g:floaterm_height = materia#conf('packages.vim_floaterm.height')
  let g:floaterm_rootmarkers = materia#conf('packages.vim_floaterm.rootmarkers')
  " Close window if the job exits normally, otherwise stay it with messages like [Process exited 101]
  let g:floaterm_autoclose = 0
endfunction
function! s:vim_floaterm.listener()
endfunction
function! s:vim_floaterm.install(install)
  call a:install('voldikss/vim-floaterm')
endfunction
call materia#packages#add('vim_floaterm', s:vim_floaterm)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_smooth_scroll
" Use (neo)vim terminal in the floating/popup window.
" https://github.com/voldikss/vim-floaterm
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_smooth_scroll = {'name': 'vim-smooth-scroll'}
function! s:vim_smooth_scroll.listener()
  let speed = materia#conf('packages.vim_smooth_scroll.speed')
  execute 'noremap <silent> <c-u> :call smooth_scroll#up(&scroll, '. speed .', 1)<CR>'
  execute 'noremap <silent> <c-d> :call smooth_scroll#down(&scroll, '. speed .', 1)<CR>'
  execute 'noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, '. speed .', 1)<CR>'
  execute 'noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, '. speed .', 1)<CR>'
endfunction
function! s:vim_smooth_scroll.install(install)
  call a:install('terryma/vim-smooth-scroll')
endfunction
call materia#packages#add('vim_smooth_scroll', s:vim_smooth_scroll)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" editorconfig_vim
" This is an EditorConfig plugin for Vim. This plugin can be found on both GitHub and Vim online.
" https://github.com/editorconfig/editorconfig-vim
" https://editorconfig.org/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:editorconfig_vim = {'name': 'editorconfig-vim'}
function! s:editorconfig_vim.config()
  let g:EditorConfig_exclude_patterns = materia#conf('packages.editorconfig_vim.exclude_patterns')
endfunction
function! s:editorconfig_vim.listener()
  " disable this plugin for a specific buffer
  let types = materia#conf('packages.editorconfig_vim.disable_types')
  execute 'autocmd FileType '. join(types, ',') .' let b:EditorConfig_disable = 1'
endfunction
function! s:editorconfig_vim.install(install)
  call a:install('editorconfig/editorconfig-vim')
endfunction
call materia#packages#add('editorconfig_vim', s:editorconfig_vim)
