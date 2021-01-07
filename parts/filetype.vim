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
let html5_vim = {'id': 'html5_vim', 'directory': 'html5.vim'}
function! html5_vim.preloader()
  let g:html5_event_handler_attributes_complete = materia#conf('parts.html5_vim.attr_event_handler')
  let g:html5_rdfa_attributes_complete = materia#conf('parts.html5_vim.attr_rdfa')
  let g:html5_microdata_attributes_complete = materia#conf('parts.html5_vim.attr_microdata')
  let g:html5_aria_attributes_complete = materia#conf('parts.html5_vim.attr_aria')
endfunction
function! html5_vim.loader()
  let filetypes = materia#conf('parts.html5_vim.filetypes')
  execute 'autocmd FileType '. join(filetypes, ',') .' EmmetInstall'
endfunction
function! html5_vim.installer(install)
  call a:install('othree/html5.vim')
endfunction
call materia#part#add(html5_vim)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" emmet_vim
" emmet-vim is a vim plug-in which provides support for expanding abbreviations similar to emmet.
" https://github.com/mattn/emmet-vim
" snippets.json Doc:
" https://docs.emmet.io/customization/snippets/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let emmet_vim = {'id': 'emmet_vim', 'directory': 'emmet-vim', 'includes': ['webapi']}
function! emmet_vim.preloader()
  if materia#conf('html.snippet_path')
    let g:user_emmet_install_global = 0
    let snippet_path = materia#conf('parts.emmet_vim.snippet_path')
    if snippet_path
      let g:user_emmet_settings = webapi#json#decode(join(readfile(expand(snippet_path)), "\n"))
    endif
  endif
  let g:user_emmet_leader_key = '<C-' . materia#conf('parts.emmet_vim.key_ctrl') . '>'
endfunction
function! emmet_vim.loader()
  if (exists('g:loaded_emmet_vim') && g:loaded_emmet_vim)
    let filetypes = materia#conf('parts.emmet_vim.filetypes')
    execute 'autocmd FileType '. join(filetypes, ',') .' EmmetInstall'
  endif
endfunction
function! emmet_vim.installer(install)
  call a:install('mattn/emmet-vim')
endfunction
call materia#part#add(emmet_vim)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic
" Syntastic is a syntax checking plugin for Vim created by Martin Grenfell.
" It runs files through external syntax checkers and displays any resulting errors to the user.
" https://github.com/vim-syntastic/syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let syntastic = {'id': 'syntastic', 'directory': 'syntastic'}

function! syntastic.preloader()
  " status line
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
endfunction

function! syntastic.installer(install)
  call a:install('vim-syntastic/syntastic')
endfunction
call materia#part#add(syntastic)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nginx
" Improved nginx vim plugin (incl. syntax highlighting)
" https://github.com/chr4/nginx.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let nginx = {'id': 'nginx', 'directory': 'nginx.vim'}
function! nginx.installer(install)
  call a:install('chr4/nginx.vim')
endfunction
call materia#part#add(nginx)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_go
" Go development plugin for Vim
" https://github.com/fatih/vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vim_go = {'id': 'vim_go', 'directory': 'vim-go'}
function! vim_go.preloader()
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
  let g:go_fmt_autosave = materia#conf('parts.vim_go.fmt_autosave')
  let g:go_mod_fmt_autosave = materia#conf('parts.vim_go.mod_fmt_autosave')
  let g:go_imports_autosave = materia#conf('parts.vim_go.imports_autosave')
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
  let g:go_highlight_types = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_generate_tags = 1

  " let g:go_highlight_extra_types = 1
  " let g:go_highlight_operators = 1
  " let g:go_highlight_function_parameters = 1
  " let g:go_highlight_function_calls = 1
  " let g:go_highlight_types = 1
  " let g:go_highlight_fields = 1
  " let g:go_highlight_generate_tags = 1
  " let g:go_highlight_string_spellcheck = 1
  " let g:go_highlight_format_strings = 1
  " let g:go_highlight_variable_declarations = 1
  " let g:go_highlight_variable_assignments = 1

  " go metalinter
  let g:go_metalinter_autosave_enabled = ['all']
  let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
  let g:go_metalinter_command = "golangci-lint"

  " key mappings
  let runner = materia#conf('key.runner')
  let coding = materia#conf('key.coding')
  let writer = materia#conf('key.writer')
  " executecurrent file(s) gl
  execute 'autocmd FileType go nmap <buffer> <silent> '. runner .'r <Plug>(go-run)'
  execute 'autocmd FileType go nmap <buffer> <silent> '. runner .'b <Plug>(go-build)'
  execute 'autocmd FileType go nmap <buffer> <silent> '. runner .'i <Plug>(go-install)'
  execute 'autocmd FileType go nmap <buffer> <silent> '. writer . coding .'p <Plug>(go-imports)'
  execute 'autocmd FileType go nmap <buffer> <silent> '. runner .'m <Plug>(go-metalinter)'
  execute 'autocmd FileType go nmap <buffer> <silent> '. runner .'l <Plug>(go-lint)'
  execute 'autocmd FileType go nmap <buffer> <silent> '. runner .'v <Plug>(go-vet)'
  execute 'autocmd FileType go nmap <buffer> <silent> '. runner .'e <Plug>(go-alternate-edit)'
  " go test
  execute 'autocmd FileType go nmap <buffer> <silent> '. runner .'tt <Plug>(go-test)'
  execute 'autocmd FileType go nmap <buffer> <silent> '. runner .'tf <Plug>(go-test-func)'
  execute 'autocmd FileType go nmap <buffer> <silent> '. runner .'tc <Plug>(go-test-compile)'

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

function! vim_go.installer(install)
  call a:install('fatih/vim-go', { 'do': ':GoUpdateBinaries' })
endfunction

call materia#part#add(vim_go)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_json
" A better JSON for Vim: distinct highlighting of keywords vs values, JSON-specific (non-JS) warnings, quote concealing. Pathogen-friendly.
" https://github.com/elzr/vim-json
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vim_json = {'id': 'vim_json', 'directory': 'vim-json'}

function! vim_json.preloader()
  set conceallevel=0
  let g:vim_json_syntax_conceal = materia#conf('parts.vim_json.syntax_conceal')
endfunction

function! vim_json.installer(install)
  call a:install('elzr/vim-json')
endfunction

call materia#part#add(vim_json)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" javascript_syntax
" Enhanced javascript syntax file for Vim
" https://github.com/pangloss/vim-javascript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let javascript_syntax = {'id': 'javascript_syntax', 'directory': 'vim-javascript-syntax'}
function! javascript_syntax.preloader()
  
endfunction
function! javascript_syntax.installer(install)
  call a:install('jelera/vim-javascript-syntax')
endfunction
call materia#part#add(javascript_syntax)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" typescript_vim
" Typescript syntax files for Vim
" https://github.com/leafgarland/typescript-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let typescript_vim = {'id': 'typescript_vim', 'directory': 'typescript-vim'}
function! typescript_vim.preloader()
  let g:typescript_compiler_binary = materia#conf('parts.typescript_vim.attr_compiler_binary')
  let g:typescript_compiler_options = materia#conf('parts.typescript_vim.attr_compiler_options')

  autocmd FileType typescript :set makeprg=tsc

  autocmd QuickFixCmdPost [^l]* nested cwindow
  autocmd QuickFixCmdPost    l* nested lwindow
endfunction

function! typescript_vim.installer(install)
  call a:install('leafgarland/typescript-vim')
endfunction

call materia#part#add(typescript_vim)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jsx_highlight
" JSX and TSX syntax pretty highlighting for vim.
" https://github.com/mxw/vim-jsx
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let jsx_highlight = {'id': 'jsx_highlight', 'directory': 'vim-jsx-pretty'}
function! jsx_highlight.installer(install)
  call a:install('maxmellon/vim-jsx-pretty')
endfunction
call materia#part#add(jsx_highlight)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_markdown
" This is the development version of Vim's included syntax highlighting and filetype plugins for Markdown.
" https://github.com/tpope/vim-markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vim_markdown = {'id': 'vim_markdown', 'directory': 'vim-markdown'}
function! vim_markdown.preloader()
  let g:markdown_fenced_languages = materia#conf('parts.vim_markdown.attr_fenced_languages')
  let g:markdown_minlines = materia#conf('parts.vim_markdown.attr_minlines')
endfunction
function! vim_markdown.installer(install)
  call a:install('tpope/vim-markdown')
endfunction
call materia#part#add(vim_markdown)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cpp_enhanced_highlight
" Additional Vim syntax highlighting for C++ (including C++11/14/17)
" https://github.com/octol/vim-cpp-enhanced-highlight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let cpp_enhanced_highlight = {'id': 'cpp_enhanced_highlight', 'directory': 'vim-cpp-enhanced-highlight'}
function! cpp_enhanced_highlight.preloader()
  let g:cpp_class_scope_highlight = 1
  let g:cpp_member_variable_highlight = 1
  let g:cpp_class_decl_highlight = 1
  let g:cpp_experimental_template_highlight = 1
  let c_no_curly_error=1
endfunction
function! cpp_enhanced_highlight.installer(install)
  call a:install('octol/vim-cpp-enhanced-highlight')
endfunction
call materia#part#add(cpp_enhanced_highlight)
