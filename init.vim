if has('win16') || has('win32') || has('win64')
    if has('nvim')
        call automemories#init($HOME . '/AppData/Local/nvim')
    else
        call automemories#init($HOME . '/vimfiles')
    endif
else
    if has('nvim')
        call automemories#init($HOME . '/.config/nvim')
    else
        call automemories#init($HOME . '/.vim')
    endif
endif
