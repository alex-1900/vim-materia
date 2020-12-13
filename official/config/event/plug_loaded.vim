"=============================================================================
" FILE: plug_loaded.vim
" AUTHOR:  Alex Layton <omytty.alex@126.com>
" License: MIT license
"=============================================================================

augroup plug_loaded
    autocmd!
    autocmd User AutomemoriesPlugLoaded
        \ call ListenerLoadedPlugStartify()
        \| call ListenerPlugLoadedNerdtree()
        \| call ListenerPlugLoadedAirline()
        \| call ListenerPlugLoadedAirLineThemes()
augroup end
