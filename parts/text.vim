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
let auto_pairs = {'id': 'auto_pairs', 'directory': 'auto-pairs'}
function! auto_pairs.installer(install)
  call a:install('jiangmiao/auto-pairs')
endfunction
call materia#part#add(auto_pairs)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdcommenter
" Comment functions so powerful—no comment necessary.
" https://github.com/preservim/nerdcommenter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let nerdcommenter = {'id': 'nerdcommenter', 'directory': 'nerdcommenter'}
function! nerdcommenter.preloader()
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

function! nerdcommenter.loader()
  let key_prefix = GetConfigMapPrefix(materia#config#get('parts.nerdcommenter.key_writer'))
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

function! nerdcommenter.installer(install)
  call a:install('preservim/nerdcommenter')
endfunction
call materia#part#add(nerdcommenter)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" supertab
" Perform all your vim insert mode completions with Tab
" https://github.com/ervandew/supertab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let supertab = {'id': 'supertab', 'directory': 'supertab'}
function! supertab.preloader()
  let g:SuperTabDefaultCompletionType = materia#config#get('parts.supertab.scroll')
endfunction
function! supertab.installer(install)
  call a:install('ervandew/supertab')
endfunction
call materia#part#add(supertab)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_easy_align
" A simple, easy-to-use Vim alignment plugin.
" https://github.com/junegunn/vim-easy-align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vim_easy_align = {'id': 'vim_easy_align', 'directory': 'vim-easy-align'}
function! vim_easy_align.loader()
  let key_prefix = GetConfigMapPrefix(materia#config#get('parts.vim_easy_align.key_writer'))
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  execute 'xmap '. key_prefix.writer .' <Plug>(EasyAlign)'
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  execute 'nmap '. key_prefix.writer .' <Plug>(EasyAlign)'
endfunction
function! vim_easy_align.installer(install)
  call a:install('junegunn/vim-easy-align')
endfunction
call materia#part#add(vim_easy_align)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_surround
" The plugin provides mappings to easily delete, change and add such surroundings in pairs.
" https://github.com/tpope/vim-surround
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vim_surround = {'id': 'vim_surround', 'directory': 'vim-surround'}
function! vim_surround.installer(install)
  call a:install('tpope/vim-surround')
endfunction
call materia#part#add(vim_surround)

" vim_visual_multi
" It's called vim-visual-multi in analogy with visual-block, but the plugin works mostly from normal mode.
" https://github.com/mg979/vim-visual-multi
" https://github.com/mg979/vim-visual-multi/wiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vim_visual_multi = {'id': 'vim_visual_multi', 'directory': 'vim-visual-multi'}
function! vim_visual_multi.preloader()
  " vim-visual-multi
  let g:VM_leader = "'"
  " let g:VM_maps = {}
  " let g:VM_maps["Add Cursor Down"] = '<C-j>'
  " let g:VM_maps["Add Cursor Up"] = '<C-k>'
  " let g:VM_maps["Select l"] = '<C-l>'
  " let g:VM_maps["Select h"] = '<C-h>'
endfunction

function! vim_visual_multi.installer(install)
  call a:install('mg979/vim-visual-multi')
endfunction

call materia#part#add(vim_visual_multi)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim_better_whitespace
" This plugin causes all trailing whitespace characters to be highlighted. 
" https://github.com/ntpeters/vim-better-whitespace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vim_better_whitespace = {'id': 'vim_better_whitespace', 'directory': 'vim-better-whitespace'}
function! vim_better_whitespace.preloader()
  let g:better_whitespace_enabled = 1
  let g:strip_whitespace_on_save = materia#config#get('parts.vim_better_whitespace.strip_on_save')
  let g:better_whitespace_ctermcolor = materia#config#get('parts.vim_better_whitespace.ctermcolor')
  let g:better_whitespace_guicolor = materia#config#get('parts.vim_better_whitespace.guicolor')
endfunction

function! vim_better_whitespace.installer(install)
  call a:install('ntpeters/vim-better-whitespace')
endfunction

call materia#part#add(vim_better_whitespace)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" editorconfig_vim
" This is an EditorConfig plugin for Vim. This plugin can be found on both GitHub and Vim online.
" https://github.com/editorconfig/editorconfig-vim
" https://editorconfig.org/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let editorconfig_vim = {'id': 'editorconfig_vim', 'directory': 'editorconfig-vim'}
function! editorconfig_vim.preloader()
  let g:EditorConfig_exclude_patterns = materia#config#get('parts.editorconfig_vim.exclude_patterns')
endfunction

function! editorconfig_vim.loader()
  " disable this plugin for a specific buffer
  let types = materia#config#get('parts.editorconfig_vim.disable_types')
  execute 'autocmd FileType '. join(types, ',') .' let b:EditorConfig_disable = 1'
endfunction

function! editorconfig_vim.installer(install)
  call a:install('editorconfig/editorconfig-vim')
endfunction

call materia#part#add(editorconfig_vim)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" deoppet
" The dark powered snippet plugin for neovim
" https://github.com/Shougo/deoppet.nvim
"
" Default snippets for `neosnippets`
" https://github.com/Shougo/neosnippet-snippets/tree/master/neosnippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let deoppet = {'id': 'deoppet', 'directory': 'deoppet.nvim'}

function! deoppet.condition()
  return has('nvim-0.5.0')
endfunction

function! deoppet.loader()
  call deoppet#initialize()
  call deoppet#custom#option('snippets', map(globpath(&runtimepath, 'neosnippets', 1, 1), "{ 'path': v:val }"))

  imap <C-k>  <Plug>(deoppet_expand)
  imap <C-f>  <Plug>(deoppet_jump_forward)
  imap <C-b>  <Plug>(deoppet_jump_backward)
  smap <C-f>  <Plug>(deoppet_jump_forward)
  smap <C-b>  <Plug>(deoppet_jump_backward)
endfunction

function! deoppet.installer(install)
  if has('nvim-0.5.0')
    call a:install('Shougo/deoppet.nvim', { 'do': ':UpdateRemotePlugins' })
  endif
endfunction

call materia#part#add(deoppet)

" old_easyclip {
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " vim_cutlass
    " Plugin that adds a 'cut' operation separate from 'delete'
    " https://github.com/svermeulen/vim-cutlass
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let vim_cutlass = {'id': 'vim_cutlass', 'directory': 'vim-cutlass'}
    function! vim_cutlass.loader()

    endfunction
    function! vim_cutlass.installer(install)
      call a:install('svermeulen/vim-cutlass')
    endfunction

    call materia#part#add(vim_cutlass)

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " vim_yoink
    " Vim plugin that maintains a yank history to cycle between when pasting
    " https://github.com/svermeulen/vim-yoink
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let vim_yoink = {'id': 'vim_yoink', 'directory': 'vim-yoink'}
    function! vim_yoink.preloader()
      let g:yoinkIncludeDeleteOperations = 1
    endfunction
  
    function! vim_yoink.loader()
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
  
    function! vim_yoink.installer(install)
      call a:install('svermeulen/vim-yoink')
    endfunction

    call materia#part#add(vim_yoink)

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " vim_subversive
    " Plugin that adds a 'cut' operation separate from 'delete'
    " https://github.com/svermeulen/vim-cutlass
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    let vim_subversive = {'id': 'vim_subversive', 'directory': 'vim-subversive'}
  
    function! vim_subversive.loader()
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
  
    function! vim_subversive.installer(install)
      call a:install('svermeulen/vim-subversive')
    endfunction

    call materia#part#add(vim_subversive)
"}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion
" Vim motions on speed!
" https://github.com/easymotion/vim-easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let easymotion = {'id': 'easymotion', 'directory': 'vim-easymotion'}
function! easymotion.preloader()
  " Disable default mappings
  let g:EasyMotion_do_mapping = 0
  " Turn on case-insensitive feature
  let g:EasyMotion_smartcase = materia#config#get('parts.easymotion.attr_smartcase')
  " keep cursor column when JK motion
  let g:EasyMotion_startofline = 0
endfunction

function! easymotion.loader()
  " `s{char}{char}{label}`
  " Need one more keystroke, but on average, it may be more comfortable.
  let okey = materia#config#get('parts.easymotion.prefix_key')
  execute 'nmap '. okey .'f <Plug>(easymotion-overwin-f)'
  execute 'nmap '. okey .'s <Plug>(easymotion-overwin-f2)'
  execute 'nmap '. okey .'w <Plug>(easymotion-overwin-w)'
  execute 'nmap '. okey .'r <Plug>(easymotion-repeat)'
  " JK motions: Line motions
  execute 'map '. okey .'j <Plug>(easymotion-j)'
  execute 'map '. okey .'k <Plug>(easymotion-k)'
  execute 'map '. okey .'l <Plug>(easymotion-lineforward)'
  execute 'map '. okey .'h <Plug>(easymotion-linebackward)'

  " Gif config
  map  / <Plug>(easymotion-sn)
  omap / <Plug>(easymotion-tn)
  " These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
  " Without these mappings, `n` & `N` works fine. (These mappings just provide
  " different highlight method and have some other features )
  map  n <Plug>(easymotion-next)
  map  N <Plug>(easymotion-prev)
  " https://github.com/neoclide/coc.nvim/issues/110#issuecomment-631868877
  if g:did_coc_loaded
    let g:easymotion#is_active = 0
    function! EasyMotionCoc() abort
      if EasyMotion#is_active()
        let g:easymotion#is_active = 1
        silent! CocDisable
      else
        if g:easymotion#is_active == 1
          let g:easymotion#is_active = 0
          silent! CocEnable
        endif
      endif
    endfunction
    autocmd TextChanged,CursorMoved * call EasyMotionCoc()
  endif
endfunction

function! easymotion.installer(install)
  call a:install('easymotion/vim-easymotion')
endfunction

call materia#part#add(easymotion)
