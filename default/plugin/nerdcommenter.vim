"=============================================================================
" FILE: nerdcommenter.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"
" Comment functions so powerful—no comment necessary.
" https://github.com/preservim/nerdcommenter
"=============================================================================

" Create default mappings
let g:NERDCreateDefaultMappings = 1

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

Plug 'preservim/nerdcommenter'
