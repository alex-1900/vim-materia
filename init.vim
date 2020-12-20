if automemories#util#is_windows()
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
