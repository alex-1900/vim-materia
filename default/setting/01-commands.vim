"=============================================================================
" FILE: 01-commands.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

" create a custom session
command! -nargs=1 AmSessionCreate call automemories#session#save_custom(<f-args>)

" load a custom session
command! -nargs=1 AmSessionLoad call automemories#session#load_custom(<f-args>)

" Delete a custom session
command! -nargs=1 AmSessionDelete call automemories#session#delete_custom(<f-args>)
