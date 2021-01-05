"=============================================================================
" FILE: text.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto_pairs
" Insert or delete brackets, parens, quotes in pair.
" https://github.com/jiangmiao/auto-pairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:auto_pairs = {'name': 'auto-pairs'}
function! s:auto_pairs.installer(install)
  call a:install('jiangmiao/auto-pairs')
endfunction
call materia#packages#add('auto_pairs', s:auto_pairs)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdcommenter
" Comment functions so powerful—no comment necessary.
" https://github.com/preservim/nerdcommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:nerdcommenter = {'name': 'nerdcommenter'}
function! s:nerdcommenter.preloader()
  " Create default mappings
  let g:NERDCreateDefaultMappings = 0
  " Add spaces after comment delimiters by default
  let g:NERDSpaceDelims = 1
  " Use compact syntax for prettified multi-line comments
  let g:NERDCompactSexyComs = 1
  " Align line-wise comment delimiters flush left instead of following code indentation
  let g:NERDDefaultAlign = 'left'
  " Allow commenting and inverting empty lines (useful when commenting a region)
  let g:NERDCommentEmptyLines = 1
  " Enable trimming of trailing whitespace when uncommenting
  let g:NERDTrimTrailingWhitespace = 1
  " Enable NERDCommenterToggle to check all selected lines is commented or not 
  let g:NERDToggleCheckAllLines = 1
endfunction

function! s:nerdcommenter.loader()
  let key_prefix = GetConfigMapPrefix(materia#conf('packages.nerdcommenter.key_writer'))
  execute 'nmap <silent> '. key_prefix.writer .'c <Plug>NERDCommenterComment'
  execute 'xmap <silent> '. key_prefix.writer .'c <Plug>NERDCommenterComment'
  execute 'nmap <silent> '. key_prefix.writer .'t <Plug>NERDCommenterToggle'
  execute 'xmap <silent> '. key_prefix.writer .'t <Plug>NERDCommenterToggle'
  execute 'nmap <silent> '. key_prefix.writer .'m <Plug>NERDCommenterMinimal'
  execute 'xmap <silent> '. key_prefix.writer .'m <Plug>NERDCommenterMinimal'
  execute 'nmap <silent> '. key_prefix.writer .'n <Plug>NERDCommenterNested'
  execute 'xmap <silent> '. key_prefix.writer .'n <Plug>NERDCommenterNested'
  execute 'nmap <silent> '. key_prefix.writer .'$ <Plug>NERDCommenterToEOL'
  execute 'nmap <silent> '. key_prefix.writer .'i <Plug>NERDCommenterInvert'
  execute 'xmap <silent> '. key_prefix.writer .'i <Plug>NERDCommenterInvert'
  execute 'nmap <silent> '. key_prefix.writer .'s <Plug>NERDCommenterSexy'
  execute 'xmap <silent> '. key_prefix.writer .'s <Plug>NERDCommenterSexy'
  execute 'nmap <silent> '. key_prefix.writer .'y <Plug>NERDCommenterYank'
  execute 'xmap <silent> '. key_prefix.writer .'y <Plug>NERDCommenterYank'
  execute 'nmap <silent> '. key_prefix.writer .'A <Plug>NERDCommenterAppend'
  execute 'nmap <silent> '. key_prefix.writer .'l <Plug>NERDCommenterAlignLeft'
  execute 'xmap <silent> '. key_prefix.writer .'l <Plug>NERDCommenterAlignLeft'
  execute 'nmap <silent> '. key_prefix.writer .'b <Plug>NERDCommenterAlignBoth'
  execute 'xmap <silent> '. key_prefix.writer .'b <Plug>NERDCommenterAlignBoth'
  execute 'nmap <silent> '. key_prefix.writer .'u <Plug>NERDCommenterUncomment'
  execute 'xmap <silent> '. key_prefix.writer .'u <Plug>NERDCommenterUncomment'
  execute 'nmap <silent> '. key_prefix.writer .'a <Plug>NERDCommenterAltDelims'
  execute 'imap <silent> <C-_> <Plug>NERDCommenterInsert'
endfunction

function! s:nerdcommenter.installer(install)
  call a:install('preservim/nerdcommenter')
endfunction
call materia#packages#add('nerdcommenter', s:nerdcommenter)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" supertab
" Perform all your vim insert mode completions with Tab
" https://github.com/ervandew/supertab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:supertab = {'name': 'supertab'}
function! s:supertab.preloader()
  let g:SuperTabDefaultCompletionType = materia#conf('packages.supertab.scroll')
endfunction
function! s:supertab.installer(install)
  call a:install('ervandew/supertab')
endfunction
call materia#packages#add('supertab', s:supertab)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_easy_align
" A simple, easy-to-use Vim alignment plugin.
" https://github.com/junegunn/vim-easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_easy_align = {'name': 'vim-easy-align'}
function! s:vim_easy_align.loader()
  let key_prefix = GetConfigMapPrefix(materia#conf('packages.vim_easy_align.key_writer'))
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  execute 'xmap '. key_prefix.writer .' <Plug>(EasyAlign)'
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  execute 'nmap '. key_prefix.writer .' <Plug>(EasyAlign)'
endfunction
function! s:vim_easy_align.installer(install)
  call a:install('junegunn/vim-easy-align')
endfunction
call materia#packages#add('vim_easy_align', s:vim_easy_align)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_surround
" The plugin provides mappings to easily delete, change and add such surroundings in pairs.
" https://github.com/tpope/vim-surround
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_surround = {'name': 'vim-surround'}
function! s:vim_surround.installer(install)
  call a:install('tpope/vim-surround')
endfunction
call materia#packages#add('vim_surround', s:vim_surround)

" vim_visual_multi
" It's called vim-visual-multi in analogy with visual-block, but the plugin works mostly from normal mode.
" https://github.com/mg979/vim-visual-multi
" https://github.com/mg979/vim-visual-multi/wiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_visual_multi = {'name': 'vim-visual-multi'}
function! s:vim_visual_multi.preloader()
  " vim-visual-multi
  let g:VM_leader = "'"
  " let g:VM_maps = {}
  " let g:VM_maps["Add Cursor Down"] = '<C-j>'
  " let g:VM_maps["Add Cursor Up"] = '<C-k>'
  " let g:VM_maps["Select l"] = '<C-l>'
  " let g:VM_maps["Select h"] = '<C-h>'
endfunction
function! s:vim_visual_multi.installer(install)
  call a:install('mg979/vim-visual-multi')
endfunction
call materia#packages#add('vim_visual_multi', s:vim_visual_multi)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_better_whitespace
" This plugin causes all trailing whitespace characters to be highlighted. 
" https://github.com/ntpeters/vim-better-whitespace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_better_whitespace = {'name': 'vim-better-whitespace'}
function! s:vim_better_whitespace.preloader()
  let g:better_whitespace_enabled = 1
  let g:strip_whitespace_on_save = materia#conf('packages.vim_better_whitespace.strip_on_save')
  let g:better_whitespace_ctermcolor = materia#conf('packages.vim_better_whitespace.ctermcolor')
  let g:better_whitespace_guicolor = materia#conf('packages.vim_better_whitespace.guicolor')
endfunction
function! s:vim_better_whitespace.installer(install)
  call a:install('ntpeters/vim-better-whitespace')
endfunction
call materia#packages#add('vim_better_whitespace', s:vim_better_whitespace)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" editorconfig_vim
" This is an EditorConfig plugin for Vim. This plugin can be found on both GitHub and Vim online.
" https://github.com/editorconfig/editorconfig-vim
" https://editorconfig.org/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:editorconfig_vim = {'name': 'editorconfig-vim'}
function! s:editorconfig_vim.preloader()
  let g:EditorConfig_exclude_patterns = materia#conf('packages.editorconfig_vim.exclude_patterns')
endfunction
function! s:editorconfig_vim.loader()
  " disable this plugin for a specific buffer
  let types = materia#conf('packages.editorconfig_vim.disable_types')
  execute 'autocmd FileType '. join(types, ',') .' let b:EditorConfig_disable = 1'
endfunction
function! s:editorconfig_vim.installer(install)
  call a:install('editorconfig/editorconfig-vim')
endfunction
call materia#packages#add('editorconfig_vim', s:editorconfig_vim)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" deoppet
" The dark powered snippet plugin for neovim
" https://github.com/Shougo/deoppet.nvim
"
" Default snippets for `neosnippets`
" https://github.com/Shougo/neosnippet-snippets/tree/master/neosnippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:deoppet = {'name': 'deoppet.nvim'}

function! s:deoppet.condition()
  return has('nvim-0.5.0')
endfunction

function! s:deoppet.loader()
  call deoppet#initialize()
  call deoppet#custom#option('snippets', map(globpath(&runtimepath, 'neosnippets', 1, 1), "{ 'path': v:val }"))

  imap <C-k>  <Plug>(deoppet_expand)
  imap <C-f>  <Plug>(deoppet_jump_forward)
  imap <C-b>  <Plug>(deoppet_jump_backward)
  smap <C-f>  <Plug>(deoppet_jump_forward)
  smap <C-b>  <Plug>(deoppet_jump_backward)
endfunction

function! s:deoppet.installer(install)
  if has('nvim-0.5.0')
    call a:install('Shougo/deoppet.nvim', { 'do': ':UpdateRemotePlugins' })
  endif
endfunction
call materia#packages#add('deoppet', s:deoppet)

" old_easyclip {
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " vim_cutlass
    " Plugin that adds a 'cut' operation separate from 'delete'
    " https://github.com/svermeulen/vim-cutlass
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let s:vim_cutlass = {'name': 'vim-cutlass'}
    function! s:vim_cutlass.loader()

    endfunction
    function! s:vim_cutlass.installer(install)
      call a:install('svermeulen/vim-cutlass')
    endfunction

    call materia#packages#add('vim_cutlass', s:vim_cutlass)

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " vim_yoink
    " Vim plugin that maintains a yank history to cycle between when pasting
    " https://github.com/svermeulen/vim-yoink
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let s:vim_yoink = {'name': 'vim-yoink'}
    function! s:vim_yoink.preloader()
      let g:yoinkIncludeDeleteOperations = 1
    endfunction
    function! s:vim_yoink.loader()
      nmap <c-n> <plug>(YoinkPostPasteSwapBack)
      nmap <c-p> <plug>(YoinkPostPasteSwapForward)
      nmap p <plug>(YoinkPaste_p)
      nmap P <plug>(YoinkPaste_P)
      nmap [y <plug>(YoinkRotateBack)
      nmap ]y <plug>(YoinkRotateForward)
      nmap y <plug>(YoinkYankPreserveCursorPosition)
      xmap y <plug>(YoinkYankPreserveCursorPosition)
      nmap <c-=> <plug>(YoinkPostPasteToggleFormat)
    endfunction
    function! s:vim_yoink.installer(install)
      call a:install('svermeulen/vim-yoink')
    endfunction

    call materia#packages#add('vim_yoink', s:vim_yoink)

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " vim_subversive
    " Plugin that adds a 'cut' operation separate from 'delete'
    " https://github.com/svermeulen/vim-cutlass
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let s:vim_subversive = {'name': 'vim-subversive'}
    function! s:vim_subversive.loader()
      nmap s <plug>(SubversiveSubstitute)
      xmap s <plug>(SubversiveSubstitute)
      nmap ss <plug>(SubversiveSubstituteLine)
      nmap S <plug>(SubversiveSubstituteToEndOfLine)
      nmap <space>s <plug>(SubversiveSubstituteRange)
      xmap <space>s <plug>(SubversiveSubstituteRange)
      nmap <space>ss <plug>(SubversiveSubstituteWordRange)
      xmap p <plug>(SubversiveSubstitute)
      xmap P <plug>(SubversiveSubstitute)
    endfunction
    function! s:vim_subversive.installer(install)
      call a:install('svermeulen/vim-subversive')
    endfunction

    call materia#packages#add('vim_subversive', s:vim_subversive)
"}
