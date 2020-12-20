"=============================================================================
" FILE: automemories.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

function! automemories#modules#get()
  return {
    \ 'aux.git': ['vim_gitgutter', 'vim_fugitive', 'coc_git'],
    \ 'aux.panel': ['vista_vim', 'vim_peekaboo', 'undotree'],
    \ 'aux.terminal': ['vim_floaterm'],
    \ 'aux.view': ['goyo', 'limelight_vim', 'vim_interestingwords'],
    \ 'code.completion': ['coc_nvim', 'supertab', 'auto_pairs', 'vim_smooth_scroll', 'vim_indentguides'],
    \ 'code.check': ['vim_better_whitespace'],
    \ 'code.comment': ['nerdcommenter'],
    \ 'code.convenience': ['vim_surround', 'vim_visual_multi', 'supertab'],
    \ 'code.format': ['vim_easy_align'],
    \ 'code.search': ['vim_visualstar', 'vim_interestingwords'],
    \ 'decoration.airline': ['vim_airline', 'vim_airline_themes', 'vim_devicons'],
    \ 'decoration.home': ['vim_startify'],
    \ 'decoration.theme': ['oceanic_next'],
    \ 'file.explorer': ['nerdtree', 'vim_nerdtree_syntax_highlight', 'vim_devicons'],
    \ 'file.search': ['fzf', 'fzf_vim'],
    \ 'lang.html': ['html5_vim', 'coc_nvim', 'coc_html', 'coc_css', 'webapi_vim', 'emmet_vim', 'supertab'],
    \ 'lang.php': ['coc_nvim', 'coc_phpls', 'coc_html', 'supertab'],
    \ 'lang.vim': ['coc_nvim', 'coc_vimlsp', 'syntastic', 'supertab'],
    \ 'lang.javascript': ['vim_javascript', 'coc_nvim', 'coc_tsserver', 'coc_json', 'supertab'],
    \ 'lang.golang': ['coc_nvim', 'coc_go', 'vim_go', 'supertab'],
    \ 'lang.markdown': ['vim_markdown', 'vim_livedown']
  \ }
endfunction
